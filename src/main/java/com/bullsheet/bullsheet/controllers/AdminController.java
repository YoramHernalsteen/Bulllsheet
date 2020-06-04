package com.bullsheet.bullsheet.controllers;

import com.bullsheet.bullsheet.model.*;
import com.bullsheet.bullsheet.repositories.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Transactional
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Value("${testTime}")
    private String appTime;
    @Value("${testDate}")
    private String appDate;

    @Autowired
    AvailabilityUserRepository availabilityUserRepository;
    @Autowired
    CallsheetRepository callsheetRepository;
    @Autowired
    ProductionCompanyRepository productionCompanyRepository;
    @Autowired
    ProductionRepository productionRepository;
    @Autowired
    ShootingLocationRepository shootingLocationRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    DayPlanningRepository dayPlanningRepository;
    @Autowired
    EquipmentRepository equipmentRepository;
    @Autowired
    IndividualCalltimeRepository individualCalltimeRepository;

    private Logger logger = LoggerFactory.getLogger(AdminController.class);

    public LocalDate date;
    public LocalTime time;
    public LocalDate searchLimitDays;
    public String correctOrderCurrentDate;
    public DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
    private final java.util.Random rand = new java.util.Random();

    public void getRealOrTestValues() {
        if (appTime.equals("00:00")) time = LocalTime.now();
        else time = LocalTime.parse(appTime);
        if (appDate.equals("0000-00-00")) date = LocalDate.now();
        else date = LocalDate.parse(appDate);
        searchLimitDays = date.plusDays(7);
        correctOrderCurrentDate = dateFormatter.format(date);
    }

    @GetMapping("/edit-callsheet/{id}")
    public String callsheetEditor(HttpServletRequest request, @PathVariable(required = false) Integer id, Model model) {
        String loggedin = (String) request.getSession().getAttribute("loggedin");

        if (loggedin == null || loggedin.isEmpty()) {
            return "redirect:/login";
        }

        Callsheet callsheet = null;
        String correctedDate = null;
        boolean isAdmin = false;
        boolean allowedToSee = false;
        if (request.getSession().getAttribute("userrestrictions").equals("admin")) isAdmin = true;

        Optional<Callsheet> optionalCallsheet = callsheetRepository.findById(id);
        if (optionalCallsheet.isPresent()) {
            callsheet = optionalCallsheet.get();
            correctedDate = dateFormatter.format(callsheet.getDate());
            if (((ArrayList) request.getSession().getAttribute("productionIds")).contains(callsheet.getProduction().getId()))
                allowedToSee = true;
        }
        Collection<IndividualCalltime> ict = individualCalltimeRepository.findByCallsheet(callsheet);
        ArrayList<IndividualCalltime> castICT = new ArrayList<>();
        ArrayList<IndividualCalltime> crewICT = new ArrayList<>();
        for (IndividualCalltime i : ict) {
            if (i.getUser().getFunction().equals("cast") || i.getUser().getFunction().equals("Cast")) {
                castICT.add(i);
            } else {
                crewICT.add(i);
            }
        }
        model.addAttribute("callsheet", callsheet);
        model.addAttribute("correctedDate", correctedDate);
        model.addAttribute("users", userRepository.findByCallsheets(callsheet));
        model.addAttribute("planning", dayPlanningRepository.findByCallsheet(callsheet));
        model.addAttribute("equipment", equipmentRepository.findByCallsheets(callsheet));
        model.addAttribute("castICT", castICT);
        model.addAttribute("crewICT", crewICT);
        model.addAttribute("adminPowers", isAdmin);
        model.addAttribute("allowedToSee", allowedToSee);
        return "admin/edit-callsheet";
    }

    @GetMapping("/new-callsheet/{id}")
    public String callsheetCreator(HttpServletRequest request, @PathVariable Integer id, Model model) {
        String loggedin = (String) request.getSession().getAttribute("loggedin");

        if (loggedin == null || loggedin.isEmpty()) {
            return "redirect:/login";
        }
        getRealOrTestValues();
        Collection<Callsheet> futureCallsheets = null;
        Integer activeCallsheetId = null;
        Production production = null;
        boolean isAdmin = false;
        boolean allowedToSee = false;
        if (request.getSession().getAttribute("userrestrictions").equals("admin")) isAdmin = true;
        Optional<Production> optionalProduction = productionRepository.findById(id);
        if (optionalProduction.isPresent()) {
            production = optionalProduction.get();
            if (((ArrayList) request.getSession().getAttribute("productionIds")).contains(production.getId()))
                allowedToSee = true;

            futureCallsheets = callsheetRepository.findAllByProductionAndDateAfter(production, date.minusDays(1));
            Optional<Callsheet> optionalCallsheet = callsheetRepository.findByProductionAndDateEquals(production, date);
            if (optionalCallsheet.isPresent()) activeCallsheetId = optionalCallsheet.get().getId() + 1;
            else {
                optionalCallsheet = callsheetRepository.findFirstByProductionAndDateAfterAndDateIsBetweenOrderByDate(production, date, date, searchLimitDays);
                if (optionalCallsheet.isPresent()) activeCallsheetId = optionalCallsheet.get().getId() + 1;
            }
        }

        model.addAttribute("currentDate", date);
        model.addAttribute("production", production);
        model.addAttribute("adminPowers", isAdmin);
        model.addAttribute("futureSheets", futureCallsheets);
        model.addAttribute("activeCallsheetId", activeCallsheetId);
        model.addAttribute("allowedToSee", allowedToSee);
        return "admin/new-callsheet";
    }

    @GetMapping("/template-callsheet/{id}")
    public String templateCallsheetCreator(HttpServletRequest request, Model model, @PathVariable Integer id) {
        String loggedin = (String) request.getSession().getAttribute("loggedin");
        if (loggedin == null || loggedin.isEmpty()) {
            return "redirect:/login";
        }
        getRealOrTestValues();
        Collection<Callsheet> futureCallsheets = null;
        Callsheet callsheet = null;
        LocalDate correctedDate = null;
        boolean isAdmin = false;
        boolean allowedToSee = false;
        if (request.getSession().getAttribute("userrestrictions").equals("admin")) isAdmin = true;

        Optional<Callsheet> optionalCallsheet = callsheetRepository.findById(id);
        if (optionalCallsheet.isPresent()) {
            callsheet = optionalCallsheet.get();
            correctedDate = callsheet.getDate().plusDays(1);
            if (((ArrayList) request.getSession().getAttribute("productionIds")).contains(callsheet.getProduction().getId()))
                allowedToSee = true;
            futureCallsheets = callsheetRepository.findAllByProductionAndDateAfter(callsheet.getProduction(), date.minusDays(1));
        }
        Collection<IndividualCalltime> ict = individualCalltimeRepository.findByCallsheet(callsheet);
        ArrayList<IndividualCalltime> castICT = new ArrayList<>();
        ArrayList<IndividualCalltime> crewICT = new ArrayList<>();
        for (IndividualCalltime i : ict) {
            if (i.getUser().getFunction().equals("cast") || i.getUser().getFunction().equals("Cast")) {
                castICT.add(i);
            } else {
                crewICT.add(i);
            }
        }
        model.addAttribute("callsheet", callsheet);
        model.addAttribute("futureSheets", futureCallsheets);
        model.addAttribute("correctedDate", correctedDate);
        model.addAttribute("users", userRepository.findByCallsheets(callsheet));
        model.addAttribute("planning", dayPlanningRepository.findByCallsheet(callsheet));
        model.addAttribute("equipment", equipmentRepository.findByCallsheets(callsheet));
        model.addAttribute("castICT", castICT);
        model.addAttribute("crewICT", crewICT);
        model.addAttribute("adminPowers", isAdmin);
        model.addAttribute("allowedToSee", allowedToSee);
        model.addAttribute("date", date);
        return "admin/template-callsheet";
    }

    @PostMapping("/new-callsheet/{id}")
    public String createCallsheet(@RequestParam MultiValueMap<String, String> allInputValues,
                                  @PathVariable Integer id) {
        Callsheet callsheet = null;
        Integer newCallsheetId = null;
        LocalDate date = null;
        LocalTime calltime = null;
        ShootingLocation mainLocation = null;
        Production production = null;
        Optional<Production> optionalProduction = productionRepository.findById(id);
        if (optionalProduction.isPresent()) production = optionalProduction.get();
        ArrayList<User> users = new ArrayList<>();
        ArrayList<ShootingLocation> additionalLocations = new ArrayList<>();
        ArrayList<DayPlanning> planning = new ArrayList<>();
        ArrayList<Equipment> equipment = new ArrayList<>();
        ArrayList<IndividualCalltime> individualCalltimes = new ArrayList<>();
        for (Map.Entry<String, List<String>> entry : allInputValues.entrySet()) {

            if (entry.getKey().contains("Date")) {
                List<String> mapEntryToList = entry.getValue();
                if (!mapEntryToList.get(0).isEmpty()) date = LocalDate.parse(mapEntryToList.get(0));

            } else if (entry.getKey().contains("Time")) {
                List<String> mapEntryToList = entry.getValue();
                if (!mapEntryToList.get(0).isEmpty()) calltime = LocalTime.parse(mapEntryToList.get(0));

            } else if (entry.getKey().contains("crew")) {
                List<String> formRow = entry.getValue();
                User cycleUser = extractOrMakeUser(formRow, true, production, true);
                if (cycleUser != null) {
                    users.add(cycleUser);
                    individualCalltimes.add(individualCalltimeSetter(cycleUser, formRow.get(4), calltime));
                }
            } else if (entry.getKey().contains("cast")) {
                List<String> formRow = entry.getValue();
                User cycleUser = (extractOrMakeUser(formRow, false, production, true));
                if (cycleUser != null) {
                    users.add(cycleUser);
                    individualCalltimes.add(individualCalltimeSetter(cycleUser, formRow.get(4), calltime));
                }

            } else if (entry.getKey().contains("main")) {
                List<String> formRow = entry.getValue();
                ShootingLocation cycleLocation = extractOrMakeMainLocation(formRow, production, true);
                if (cycleLocation != null) mainLocation = cycleLocation;

            } else if (entry.getKey().contains("extra")) {
                List<String> formRow = entry.getValue();
                ShootingLocation cycleLocation = extractOrMakeAdditionalLocation(formRow, production, mainLocation, true);
                if (cycleLocation != null) additionalLocations.add(cycleLocation);

            } else if (entry.getKey().contains("planning")) {
                List<String> formRow = entry.getValue();
                DayPlanning cyclePlanning = MakeDayPlanningLine(formRow);
                if (cyclePlanning != null) planning.add(cyclePlanning);

            } else if (entry.getKey().contains("material")) {
                List<String> formRow = entry.getValue();
                Equipment cycleEquipment = extractOrMakeEquipment(formRow, production);
                if (cycleEquipment != null) equipment.add(cycleEquipment);
            }
        }

        if (date != null && calltime != null && mainLocation != null && !users.isEmpty() && !planning.isEmpty()) {
            callsheet = new Callsheet();
            callsheet.setProduction(production);
            callsheet.setProductionCompany(production.getProductionCompany());
            callsheet.setDate(date);
            callsheet.setCalltime(calltime);
            callsheet.setShootingLocation(mainLocation);
            callsheet.setAdditionalLocations(additionalLocations);
            callsheet.setUsers(users);
            callsheet.setEquipment(equipment);
            callsheetRepository.save(callsheet);
            for (DayPlanning planningRow : planning) {
                planningRow.setCallsheet(callsheet);
                dayPlanningRepository.save(planningRow);
            }
            for (IndividualCalltime ict : individualCalltimes) {
                ict.setCallsheet(callsheet);
                individualCalltimeRepository.save(ict);
            }
            newCallsheetId = callsheet.getId();
        }
        if (callsheet != null) return "redirect:/callsheet/" + newCallsheetId;
        else return "redirect:/";
    }

    @PostMapping("/edit-callsheet/{id}")
    public String editCallsheet(@PathVariable Integer id, @RequestParam MultiValueMap<String, String> allInputValues) {
        LocalDate date = null;
        LocalTime calltime = null;
        ShootingLocation mainLocation = null;
        Production production = null;
        ArrayList<User> users = new ArrayList<>();
        ArrayList<ShootingLocation> additionalLocations = new ArrayList<>();
        ArrayList<DayPlanning> planning = new ArrayList<>();
        ArrayList<Equipment> equipment = new ArrayList<>();
        ArrayList<IndividualCalltime> individualCalltimes = new ArrayList<>();
        Optional<Callsheet> callsheetOptional = callsheetRepository.findById(id);
        Callsheet callsheet = null;
        if (callsheetOptional.isPresent()) callsheet = callsheetOptional.get();
        Optional<Production> optionalProduction = productionRepository.findById(callsheet.getProduction().getId());
        if (optionalProduction.isPresent()) production = optionalProduction.get();
        Iterable<DayPlanning> dayplanningDelete = dayPlanningRepository.deleteByCallsheet(callsheet);
        Iterable<IndividualCalltime> ictDelete = individualCalltimeRepository.deleteByCallsheet(callsheet);
        for (Map.Entry<String, List<String>> entry : allInputValues.entrySet()) {

            if (entry.getKey().contains("Date")) {
                List<String> mapEntryToList = entry.getValue();
                if (!mapEntryToList.get(0).isEmpty()) date = LocalDate.parse(mapEntryToList.get(0));

            } else if (entry.getKey().contains("Time")) {
                List<String> mapEntryToList = entry.getValue();
                if (!mapEntryToList.get(0).isEmpty()) calltime = LocalTime.parse(mapEntryToList.get(0));

            } else if (entry.getKey().contains("cast")) {
                List<String> formRow = entry.getValue();
                User cycleUser = extractOrMakeUser(formRow, false, production, false);
                if (cycleUser != null) {
                    users.add(cycleUser);
                    individualCalltimes.add(individualCalltimeSetter(cycleUser, formRow.get(4), calltime));
                }
            } else if (entry.getKey().contains("crew")) {
                List<String> formRow = entry.getValue();
                User cycleUser = extractOrMakeUser(formRow, true, production, false);
                if (cycleUser != null) {
                    users.add(cycleUser);
                    individualCalltimes.add(individualCalltimeSetter(cycleUser, formRow.get(4), calltime));
                }
            } else if (entry.getKey().contains("mainLocation")) {
                List<String> formRow = entry.getValue();
                ShootingLocation cycleLocation = extractOrMakeMainLocation(formRow, production, false);
                if (cycleLocation != null) mainLocation = cycleLocation;

            } else if (entry.getKey().contains("locationJS")) {
                List<String> formRow = entry.getValue();
                ShootingLocation cycleLocation = extractOrMakeAdditionalLocation(formRow, production, mainLocation, false);
                if (cycleLocation != null) additionalLocations.add(cycleLocation);

            } else if (entry.getKey().contains("equipment")) {
                List<String> formRow = entry.getValue();
                Equipment cycleEquipment = extractEquiment(formRow, formRow.get(3));
                if (cycleEquipment != null) equipment.add(cycleEquipment);

            } else if (entry.getKey().contains("material")) {
                List<String> formRow = entry.getValue();
                Equipment cycleEquipment = extractOrMakeEquipment(formRow, production);
                if (cycleEquipment != null) equipment.add(cycleEquipment);

            } else if (entry.getKey().contains("planning")) {
                List<String> formRow = entry.getValue();
                DayPlanning cyclePlanning = MakeDayPlanningWithLocation(formRow);
                if (cyclePlanning != null) planning.add(cyclePlanning);
            }
        }
        callsheet.setCalltime(calltime);
        callsheet.setUsers(users);
        callsheet.setShootingLocation(mainLocation);
        callsheet.setAdditionalLocations(additionalLocations);
        callsheet.setEquipment(equipment);
        callsheetRepository.save(callsheet);
        for (DayPlanning planningRow : planning) {
            planningRow.setCallsheet(callsheet);
            dayPlanningRepository.save(planningRow);
        }
        for (IndividualCalltime ict : individualCalltimes) {
            ict.setCallsheet(callsheet);
            individualCalltimeRepository.save(ict);
        }
        return "redirect:/callsheet/" + id;
    }


    @PostMapping("/template-callsheet/{id}")
    public String templateCallsheet(@PathVariable Integer id, @RequestParam MultiValueMap<String, String> allInputValues) {
        Callsheet callsheet = null;
        Integer newCallsheetId = null;
        LocalDate date = null;
        LocalTime calltime = null;
        ShootingLocation mainLocation = null;
        Production production = null;
        ArrayList<User> users = new ArrayList<>();
        ArrayList<ShootingLocation> additionalLocations = new ArrayList<>();
        ArrayList<DayPlanning> planning = new ArrayList<>();
        ArrayList<Equipment> equipment = new ArrayList<>();
        ArrayList<IndividualCalltime> individualCalltimes = new ArrayList<>();
        Optional<Callsheet> callsheetOptional = callsheetRepository.findById(id);
        Callsheet oldCallsheet = null;
        if (callsheetOptional.isPresent()) oldCallsheet = callsheetOptional.get();
        Optional<Production> optionalProduction = productionRepository.findById(oldCallsheet.getProduction().getId());
        if (optionalProduction.isPresent()) production = optionalProduction.get();
        for (Map.Entry<String, List<String>> entry : allInputValues.entrySet()) {
            if (entry.getKey().contains("Date")) {
                List<String> mapEntryToList = entry.getValue();
                if (!mapEntryToList.get(0).isEmpty()) date = LocalDate.parse(mapEntryToList.get(0));

            } else if (entry.getKey().contains("Time")) {
                List<String> mapEntryToList = entry.getValue();
                if (!mapEntryToList.get(0).isEmpty()) calltime = LocalTime.parse(mapEntryToList.get(0));

            } else if (entry.getKey().contains("cast")) {
                List<String> formRow = entry.getValue();
                User cycleUser = extractOrMakeUser(formRow, false, production, false);
                if (cycleUser != null) {
                    users.add(cycleUser);
                    individualCalltimes.add(individualCalltimeSetter(cycleUser, formRow.get(4), calltime));
                }
            } else if (entry.getKey().contains("crew")) {
                List<String> formRow = entry.getValue();
                User cycleUser = extractOrMakeUser(formRow, true, production, false);
                if (cycleUser != null) {
                    users.add(cycleUser);
                    individualCalltimes.add(individualCalltimeSetter(cycleUser, formRow.get(4), calltime));
                }
            } else if (entry.getKey().contains("mainLocation")) {
                List<String> formRow = entry.getValue();
                ShootingLocation cycleLocation = extractOrMakeMainLocation(formRow, production, false);
                if (cycleLocation != null) mainLocation = cycleLocation;

            } else if (entry.getKey().contains("locationJS")) {
                List<String> formRow = entry.getValue();
                ShootingLocation cycleLocation = extractOrMakeAdditionalLocation(formRow, production, mainLocation, false);
                if (cycleLocation != null) additionalLocations.add(cycleLocation);

            } else if (entry.getKey().contains("equipment")) {
                List<String> formRow = entry.getValue();
                Equipment cycleEquipment = extractEquiment(formRow, formRow.get(3));
                if (cycleEquipment != null) equipment.add(cycleEquipment);

            } else if (entry.getKey().contains("material")) {
                List<String> formRow = entry.getValue();
                Equipment cycleEquipment = extractOrMakeEquipment(formRow, production);
                if (cycleEquipment != null) equipment.add(cycleEquipment);

            } else if (entry.getKey().contains("planning")) {
                List<String> formRow = entry.getValue();
                DayPlanning cyclePlanning = MakeDayPlanningWithLocation(formRow);
                if (cyclePlanning != null) planning.add(cyclePlanning);
            }
        }
        callsheet = new Callsheet();
        callsheet.setProduction(production);
        callsheet.setProductionCompany(production.getProductionCompany());
        callsheet.setDate(date);
        callsheet.setCalltime(calltime);
        callsheet.setUsers(users);
        callsheet.setShootingLocation(mainLocation);
        callsheet.setAdditionalLocations(additionalLocations);
        callsheet.setEquipment(equipment);
        callsheetRepository.save(callsheet);
        for (DayPlanning planningRow : planning) {
            planningRow.setCallsheet(callsheet);
            dayPlanningRepository.save(planningRow);
        }
        for (IndividualCalltime ict : individualCalltimes) {
            ict.setCallsheet(callsheet);
            individualCalltimeRepository.save(ict);
        }
        newCallsheetId = callsheet.getId();
        if (callsheet != null) return "redirect:/callsheet/" + newCallsheetId;
        else return "redirect:/";
    }


    private User extractOrMakeUser(List<String> formRow, boolean newUserIsCrew, Production production,
                                   boolean isNewCallsheet) {
        User user = null;
        String[] fullName = formRow.get(1).split(" ");
        String firstName;
        String lastName;
        if (fullName.length != 1) {
            firstName = fullName[0];
            lastName = fullName[1];
            Optional<User> optionalUser = userRepository.findByFirstNameAndLastName(firstName, lastName);
            if (optionalUser.isPresent() && isNewCallsheet) user = optionalUser.get();
            else {
                if (!isNewCallsheet && optionalUser.isPresent()) {
                    user = optionalUser.get();
                } else {
                    user = new User();
                }
                ArrayList<Production> productions = new ArrayList<>();
                ArrayList<ProductionCompany> productionCompanies = new ArrayList<>();
                productions.add(production);
                productionCompanies.add(production.getProductionCompany());
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setJobTitle(formRow.get(0));
                user.setPhoneNumber(formRow.get(2));
                user.setEmail(formRow.get(3));
                user.setUsername(randomIdentifier(true));
                user.setPassword(randomIdentifier(false));
                user.setUserRestrictions("user");
                if (newUserIsCrew) user.setFunction("Crew");
                else user.setFunction("Cast");
                user.setProduction(productions);
                user.setProductionCompany(productionCompanies);
                userRepository.save(user);
                Optional<User> optionalNewUser = userRepository.findByUsername(user.getUsername());
                if (optionalNewUser.isPresent()) user = optionalNewUser.get();
            }
        } else logger.info("Geen geldige voor- en/of achternaam ingegeven");
        return user;
    }

    private ShootingLocation extractOrMakeMainLocation(List<String> formRow, Production production,
                                                       boolean isNewCallsheet) {
        ShootingLocation location = null;
        Optional<ShootingLocation> optionalShootingLocation = shootingLocationRepository.findByNameEquals(formRow.get(0));
        if (optionalShootingLocation.isPresent() && isNewCallsheet) location = optionalShootingLocation.get();
        else if (!formRow.get(0).isEmpty()) {
            if (!isNewCallsheet && optionalShootingLocation.isPresent()) {
                location = optionalShootingLocation.get();
            } else {
                location = new ShootingLocation();
            }
            location.setName(formRow.get(0));
            location.setAdres(formRow.get(1));
            location.setZipcode(formRow.get(2));
            location.setCity(formRow.get(3));
            location.setType(formRow.get(4));
            location.setExtraInfo(formRow.get(5));
            location.setProductionCompany(production.getProductionCompany());
            shootingLocationRepository.save(location);
        }
        return location;
    }

    private ShootingLocation extractOrMakeAdditionalLocation(List<String> formRow, Production
            production, ShootingLocation mainLocation, boolean isNewCallsheet) {
        ShootingLocation location = null;
        Optional<ShootingLocation> optionalShootingLocation = shootingLocationRepository.findByNameEquals(formRow.get(0));
        if (optionalShootingLocation.isPresent() && isNewCallsheet) {
            location = optionalShootingLocation.get();
            if (location.equals(mainLocation)) return null;
        } else if (!formRow.get(0).isEmpty()) {
            if (!isNewCallsheet && optionalShootingLocation.isPresent()) {
                location = optionalShootingLocation.get();
            } else {
                location = new ShootingLocation();
            }
            location.setName(formRow.get(0));
            location.setAdres(formRow.get(1));
            location.setZipcode(formRow.get(2));
            location.setCity(formRow.get(3));
            location.setType(formRow.get(4));
            location.setExtraInfo(formRow.get(5));
            location.setProductionCompany(production.getProductionCompany());
            shootingLocationRepository.save(location);
        }
        return location;
    }

    private DayPlanning MakeDayPlanningLine(List<String> formRow) {
        DayPlanning dayPlanning = new DayPlanning();
        if (!formRow.get(0).isEmpty()) {
            dayPlanning.setTimeStart(LocalTime.parse(formRow.get(0)));
            dayPlanning.setTimeEnd(LocalTime.parse(formRow.get(1)));
            dayPlanning.setDescription(formRow.get(2));
            dayPlanningRepository.save(dayPlanning);
        }
        return dayPlanning;
    }

    private DayPlanning MakeDayPlanningWithLocation(List<String> formRow) {
        DayPlanning dayPlanning = new DayPlanning();
        if (!formRow.get(0).isEmpty()) {
            dayPlanning.setTimeStart(LocalTime.parse(formRow.get(0)));
            dayPlanning.setTimeEnd(LocalTime.parse(formRow.get(1)));
            dayPlanning.setLocation(formRow.get(2));
            dayPlanning.setDescription(formRow.get(3));
            dayPlanningRepository.save(dayPlanning);
        }
        return dayPlanning;
    }

    private Equipment extractOrMakeEquipment(List<String> formRow, Production production) {
        Equipment equipment = null;
        Optional<Equipment> optionalEquipment = equipmentRepository.findByNameEquals(formRow.get(1));
        if (optionalEquipment.isPresent()) equipment = optionalEquipment.get();
        else if (!formRow.get(0).isEmpty() || !formRow.get(1).isEmpty()) {
            equipment = new Equipment();
            equipment.setType(formRow.get(0));
            equipment.setName(formRow.get(1));
            equipment.setSpecifications(formRow.get(2));
            equipment.setProduction(production);
            equipment.setProductionCompany(production.getProductionCompany());
            equipmentRepository.save(equipment);
        }
        return equipment;
    }

    private Equipment extractEquiment(List<String> formRow, String idString) {
        Equipment equipment = null;
        int id = Integer.parseInt(idString);
        Optional<Equipment> optionalEquipment = equipmentRepository.findById(id);
        if (optionalEquipment.isPresent()) {
            equipment = optionalEquipment.get();
        }
        equipment.setType(formRow.get(0));
        equipment.setName(formRow.get(1));
        equipment.setSpecifications(formRow.get(2));
        equipmentRepository.save(equipment);
        return equipment;
    }

    public String randomIdentifier(boolean nameOrPass) {
        final String lexicon = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz12345674890";
        StringBuilder builder = new StringBuilder();
        while (builder.toString().length() == 0) {
            int length = rand.nextInt(5) + 5;
            for (int i = 0; i < length; i++) {
                builder.append(lexicon.charAt(rand.nextInt(lexicon.length())));
            }
            if (nameOrPass && userRepository.findByUsername(builder.toString()).isPresent()) {
                builder = new StringBuilder();
            }
        }
        return builder.toString();
    }

    public IndividualCalltime individualCalltimeSetter(User user, String timeString, LocalTime mainCalltime) {
        IndividualCalltime ict = new IndividualCalltime();
        if (!timeString.isEmpty()) ict.setCalltime(LocalTime.parse(timeString));
        else ict.setCalltime(mainCalltime);
        ict.setUser(user);
        individualCalltimeRepository.save(ict);
        return ict;
    }

}