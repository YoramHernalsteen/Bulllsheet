package com.bullsheet.bullsheet.controllers;

import com.bullsheet.bullsheet.Excel;
import com.bullsheet.bullsheet.model.*;
import com.bullsheet.bullsheet.repositories.*;
import com.byteowls.jopencage.JOpenCageGeocoder;
import com.byteowls.jopencage.model.JOpenCageForwardRequest;
import com.byteowls.jopencage.model.JOpenCageLatLng;
import com.byteowls.jopencage.model.JOpenCageResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Optional;

@Controller
public class HomeController {
    private static final String FILE_PATH = "callsheet.xlsx";
    private Logger logger = LoggerFactory.getLogger(HomeController.class);
    private String titel = "format purpose only";

    public LocalDate date = LocalDate.now();
    public LocalTime currentTime = LocalTime.now();
    public LocalDate testDate = LocalDate.of(2020, 7, 6);
    public LocalDate searchLimitDays = testDate.plusDays(7);
    public LocalTime testTime = LocalTime.of(15, 0);
    public DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
    public String correctOrderCurrentDate = dateFormatter.format(date);
    public HashMap<Integer, String> delay = new HashMap<>();

    JOpenCageGeocoder jOpenCageGeocoder = new JOpenCageGeocoder("45fca3be40cb4b92ab5e080285152806");

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
    @Autowired
    DelayRepository delayRepository;
    @Autowired
    NoteRepository noteRepository;

    public static byte[] getSHA(String input) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        return md.digest(input.getBytes(StandardCharsets.UTF_8));
    }

    public static String toHexString(byte[] hash) {
        BigInteger number = new BigInteger(1, hash);
        StringBuilder hexString = new StringBuilder(number.toString(16));
        while (hexString.length() < 32) {
            hexString.insert(0, '0');
        }
        return hexString.toString();
    }

    @RequestMapping("/")
    public String index(HttpServletRequest request, Model model) {
        String loggedin = (String) request.getSession().getAttribute("loggedin");

        if (loggedin == null || loggedin.isEmpty()) {
            return "redirect:/login";
        }

        User activeUser = null;
        Optional<User> optionalUser = userRepository.findById(5);
        if (optionalUser.isPresent()) activeUser = optionalUser.get();
        Collection<Production> productionsUserWorksOn = productionRepository.findByUsers(activeUser);
        model.addAttribute("username", request.getSession().getAttribute("username"));
        model.addAttribute("restriction", request.getSession().getAttribute("userrestrictions"));
        model.addAttribute("titel", titel);
        model.addAttribute("productions", productionsUserWorksOn);

        return "home";
    }

    @GetMapping("/register")
    public String registerGet(HttpServletRequest request, Model model) {
        String loggedin = (String) request.getSession().getAttribute("loggedin");

        if (loggedin != null || loggedin == "true") {
            return "redirect:/";
        }
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("register")
    public String registerPost(HttpServletRequest request, Model model, @ModelAttribute User user) {
        if (user.registerValidationEmptyCheck()) {
            Optional<User> validationTest = userRepository.findByUsername(user.getUsername());
            if (validationTest.isPresent()) {
                System.out.println("Username already taken");
                model.addAttribute("errorcode", "Username is already taken.");
                return "register";
            } else {
                System.out.println("Username check is fine. Proceed");
                ArrayList<String> userDetails = new ArrayList<String>();
                try {
                    userDetails.add(user.getUsername());
                    String passwordHashed = toHexString(getSHA(user.getPassword()));
                    userDetails.add(passwordHashed);
                    userDetails.add(user.getFirstName());
                    userDetails.add(user.getLastName());
                    userDetails.add(user.getEmail());
                    userDetails.add(user.getPhoneNumber());
                    System.out.println(userDetails);
                    User newUser = makeNewUser(userDetails, user);
                    userRepository.save(newUser);
                    return "login";
                } catch (NoSuchAlgorithmException e) {
                    e.printStackTrace();
                    return "register";
                }
            }
        } else {
            System.out.println("User forgot to fill in a field");
            model.addAttribute("errorcode", "You forgot to fill something in.");
            return "register";
        }
    }

    private User makeNewUser(ArrayList userDetails, User user) {
        User newUser = null;
        newUser = new User();

        newUser.setUsername((String) userDetails.get(0));
        newUser.setPassword((String) userDetails.get(1));
        newUser.setFirstName((String) userDetails.get(2));
        newUser.setLastName((String) userDetails.get(3));
        newUser.setEmail((String) userDetails.get(4));
        newUser.setPhoneNumber((String) userDetails.get(5));
        return newUser;
    }

    @GetMapping("/login")
    public String loginGet(HttpServletRequest request, Model model) {
        String loggedin = (String) request.getSession().getAttribute("loggedin");

        if (loggedin != null || loggedin == "true") {
            return "redirect:/";
        }

        model.addAttribute("user", new User());
        return "login";
    }

    @PostMapping("/login")
    public String loginPost(HttpServletRequest request, Model model, @ModelAttribute User user)
            throws NoSuchAlgorithmException {
        if (user.loginValidationEmptyCheck()) {
            Optional<User> validationTest = userRepository.findByUsername(user.getUsername());
            if (validationTest.isPresent()) {
                System.out.println("Username exists. Proceed login");
                String userPasswordGiven = toHexString(getSHA(user.getPassword()));
                System.out.println(validationTest.get().getPassword());
                System.out.println(userPasswordGiven);
                if (validationTest.get().getPassword().equals(userPasswordGiven)) {
                    System.out.println("pass correct");
                    System.out.println(validationTest.get().getUserRestrictions());
                    request.getSession().setAttribute("loggedin", "true");
                    request.getSession().setAttribute("username", validationTest.get().getUsername());
                    request.getSession().setAttribute("firstname", validationTest.get().getFirstName());
                    request.getSession().setAttribute("lastname", validationTest.get().getLastName());
                    request.getSession().setAttribute("function", validationTest.get().getFunction());
                    request.getSession().setAttribute("jobtitle", validationTest.get().getJobTitle());
                    request.getSession().setAttribute("userrestrictions", validationTest.get().getUserRestrictions());
                } else {
                    System.out.println("pass not correct");
                    model.addAttribute("errorcode", "Username or password are not correct");
                    return "login";
                }
            } else {
                System.out.println("Username is not registered");
                model.addAttribute("errorcode", "Username or password are not correct");
                return "login";
            }
        } else {
            System.out.println("User forgot to fill in a field");
            model.addAttribute("errorcode", "You forgot to fill something in username or password.");
            return "login";
        }

        return "redirect:/";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession(true).invalidate();

        return "redirect:/login";
    }

    @GetMapping("/compactCallsheet/{id}")
    public String compactCallsheet(HttpServletRequest request, @PathVariable(required = false) Integer id, Model model) {
        String loggedin = (String) request.getSession().getAttribute("loggedin");

        if (loggedin == null || loggedin.isEmpty()) {
            return "redirect:/login";
        }

        Production production = null;
        Callsheet callsheet = null;
        DayPlanning activeRow = null;
        DayPlanning lastRowPlanning = null;
        boolean sameDateCallsheet = true;
        boolean isAdmin = false;
        if (request.getSession().getAttribute("userrestrictions").equals("admin")) isAdmin = true;

        Optional<Production> optionalProduction = productionRepository.findById(id);
        if (optionalProduction.isPresent()) production = optionalProduction.get();
        Optional<Callsheet> optionalCallsheet = callsheetRepository.findByProductionAndDateEquals(production, testDate);
        if (optionalCallsheet.isPresent()) callsheet = optionalCallsheet.get();
        else {
            optionalCallsheet = callsheetRepository.findFirstByProductionAndDateAfterAndDateIsBetweenOrderByDate(production, testDate, testDate, searchLimitDays);
            if (optionalCallsheet.isPresent()) callsheet = optionalCallsheet.get();
            sameDateCallsheet = false;
        }
        String navUrl = null;
        Collection<DayPlanning> planning = null;
        Collection<Equipment> equipment = null;
        if (callsheet != null) {
            String shootingLoc = callsheet.getShootingLocation().getAdres() + ", " + callsheet.getShootingLocation().getZipcode() + " " + callsheet.getShootingLocation().getCity() + ", Belgium";
            JOpenCageForwardRequest jRequest = new JOpenCageForwardRequest(shootingLoc);
            jRequest.setRestrictToCountryCode("be");
            JOpenCageResponse response = jOpenCageGeocoder.forward(jRequest);
            JOpenCageLatLng result = response.getFirstPosition();
            System.out.println(result.getLat() + " + " + result.getLng());
            navUrl = "https://www.waze.com/ul?ll=" + result.getLat() + "%2C+" + result.getLng() + "&navigate=yes&zoom=17";
            planning = dayPlanningRepository.findByCallsheet(optionalCallsheet.get());
            if (planning.isEmpty()) {
                planning = null;
            }
            equipment = equipmentRepository.findByProduction(optionalProduction.get());
            if (equipment.isEmpty()) {
                equipment = null;
            }

            Optional<DayPlanning> optionalLastDayPlanningRow = dayPlanningRepository.findLatestTime(callsheet);
            if (optionalLastDayPlanningRow.isPresent()) lastRowPlanning = optionalLastDayPlanningRow.get();

            Optional<DayPlanning> optionalDayPlanning = dayPlanningRepository.findByCallsheetAndTimeBetween(testTime, callsheet.getId());
            if (optionalDayPlanning.isPresent() && callsheet.getDate().equals(testDate))
                activeRow = optionalDayPlanning.get();
            else if (callsheet.getDate().equals(testDate) && lastRowPlanning != null && testTime.isBefore(lastRowPlanning.getTimeEnd())) {
                Optional<DayPlanning> optionalEarliestDayPlanning = dayPlanningRepository.findEarliestTime(callsheet);
                if (optionalEarliestDayPlanning.isPresent()) activeRow = optionalEarliestDayPlanning.get();
            }
        }

        model.addAttribute("production", production);
        model.addAttribute("username", request.getSession().getAttribute("username"));
        model.addAttribute("currentDate", correctOrderCurrentDate);
        model.addAttribute("titel", titel);
        model.addAttribute("callsheet", callsheet);
        model.addAttribute("wazeurl", navUrl);
        model.addAttribute("planning", planning);
        model.addAttribute("equipment", equipment);
        model.addAttribute("activeRow", activeRow);
        model.addAttribute("adminPowers", isAdmin);
        model.addAttribute("sameDateCallsheet", sameDateCallsheet);

        return "compactCallsheet";
    }

    @GetMapping("/callsheet/{id}")
    public String callsheet(HttpServletRequest request, @PathVariable Integer id, Model model) {
        String loggedin = (String) request.getSession().getAttribute("loggedin");

        if (loggedin == null || loggedin.isEmpty()) {
            return "redirect:/login";
        }

        Callsheet callsheet = null;
        String correctedDate = null;
        Production production = null;
        Collection<IndividualCalltime> individualCalltimes = null;
        boolean isAdmin = false;
        if (request.getSession().getAttribute("userrestrictions").equals("admin")) isAdmin = true;

        Optional<Callsheet> optionalCallsheet = callsheetRepository.findById(id);
        if (optionalCallsheet.isPresent()) {
            callsheet = optionalCallsheet.get();
            individualCalltimes = individualCalltimeRepository.findByCallsheet(callsheet);
            correctedDate = dateFormatter.format(callsheet.getDate());
        }
        Optional<Production> optionalProduction = productionRepository.findById(id);
        if (optionalProduction.isPresent()) production = optionalProduction.get();
        String shootingLoc = callsheet.getShootingLocation().getAdres() + ", " + callsheet.getShootingLocation().getZipcode() + " " + callsheet.getShootingLocation().getCity() + ", Belgium";
        JOpenCageForwardRequest jRequest = new JOpenCageForwardRequest(shootingLoc);
        jRequest.setRestrictToCountryCode("be");
        JOpenCageResponse response = jOpenCageGeocoder.forward(jRequest);
        JOpenCageLatLng result = response.getFirstPosition();
        System.out.println(result.getLat() + " + " + result.getLng());
        String navUrl = "https://www.waze.com/ul?ll=" + result.getLat() + "%2C+" + result.getLng() + "&navigate=yes&zoom=17";
        Collection<DayPlanning> planning = dayPlanningRepository.findByCallsheet(optionalCallsheet.get());
        if (planning.isEmpty()) {
            planning = null;
        }
        Collection<Equipment> equipment = equipmentRepository.findByProduction(production);
        if (equipment.isEmpty()) {
            equipment = null;
        }
        Collection<Delay> delay = delayRepository.findByCallsheet(callsheet);
        Collection<Note> note = noteRepository.findByCallsheet(callsheet);
        model.addAttribute("crew", userRepository.findByFunctionAndCallsheets("Crew", callsheet));
        model.addAttribute("casting", userRepository.findByFunctionAndCallsheets("Cast", callsheet));
        model.addAttribute("callsheet", callsheet);
        model.addAttribute("correctedDate", correctedDate);
        model.addAttribute("username", request.getSession().getAttribute("username"));
        model.addAttribute("wazeurl", navUrl);
        model.addAttribute("planning", planning);
        model.addAttribute("equipment", callsheet.getEquipment());
        model.addAttribute("calltimes", individualCalltimes);
        model.addAttribute("adminPowers", isAdmin);
        model.addAttribute("delay", delay);
        model.addAttribute("note", note);
        return "callsheet";
    }

    @GetMapping("/download/{id}")
    public ResponseEntity<InputStreamResource> download(HttpServletRequest request, @PathVariable Integer id, Model model) throws IOException {
        this.createExcel(id);
        String filename = "callsheet.xlsx";
        File file = new File(FILE_PATH);
        InputStreamResource resource = new InputStreamResource(new FileInputStream(file));
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION,
                        "attachment;filename=" + filename)
                .contentType(MediaType.parseMediaType("application/vnd.ms-excel")).contentLength(file.length())
                .body(resource);
    }

    public void createExcel(Integer id) throws IOException {
        Callsheet callsheet = null;
        Optional<Callsheet> optionalCallsheet = callsheetRepository.findById(id);
        if (optionalCallsheet.isPresent()) {
            callsheet = optionalCallsheet.get();
            Excel excel = new Excel();
            excel.fillExcel(callsheet, dayPlanningRepository.findByCallsheet(callsheet), equipmentRepository.findByProduction(callsheet.getProduction()), individualCalltimeRepository.findByCallsheet(callsheet), delayRepository.findByCallsheet(callsheet), noteRepository.findByCallsheet(callsheet));
        }
    }

    @PostMapping("/callsheet/{id}/note")
    public String addNote(@PathVariable Integer id, @RequestParam String noteText) {
        System.out.println(noteText);
        Optional<Callsheet> callsheetOptional = callsheetRepository.findById(id);
        Note note = new Note();
        note.setCallsheet(callsheetOptional.get());
        note.setNoteText(noteText);
        noteRepository.save(note);
        return "redirect:/callsheet/" + id;
    }

    @PostMapping("/callsheet/{id}")
    public String addDelay(@PathVariable Integer id, @RequestParam String delayTime, @RequestParam String delayReason) {
        Optional<Callsheet> callsheetOptional = callsheetRepository.findById(id);
        Collection<DayPlanning> planning = dayPlanningRepository.findByCallsheet(callsheetOptional.get());
        String[] splitTime = delayTime.split(":");
        int hours = Integer.parseInt(splitTime[0]);
        int minutes = Integer.parseInt(splitTime[1]);
        int convert = hours * 60;
        minutes += convert;

        for (DayPlanning planningRow : planning) {
            planningRow.setTimeStart(planningRow.getTimeStart().plus(Duration.ofMinutes(minutes)));
            planningRow.setTimeEnd(planningRow.getTimeEnd().plus(Duration.ofMinutes(minutes)));
            dayPlanningRepository.save(planningRow);
        }
        String delayReport = "Vertraging:" + minutes + " minuten" + ", reden :" + delayReason + ". De vertraging trad op om:" + java.time.LocalTime.now();
        Delay delay = new Delay();
        delay.setCallsheet(callsheetOptional.get());
        delay.setReason(delayReason);
        delay.setDelayDuration(minutes);
        delay.setTime(java.time.LocalTime.now());
        delayRepository.save(delay);
        System.out.println(id);
        return "redirect:/callsheet/" + id;
    }

    @GetMapping("/callsheetlist/{id}")
    public String allCallsheets(@PathVariable Integer id, HttpServletRequest request, Model model,
                                @RequestParam(required = false) String searchDate,
                                @RequestParam(required = false) String searchDateStart,
                                @RequestParam(required = false) String searchDateEnd) {
        String loggedin = (String) request.getSession().getAttribute("loggedin");

        if (loggedin == null || loggedin.isEmpty()) {
            return "redirect:/login";
        }
        User user = null;
        Integer activeCallsheetId = null;
        Production production = null;
        ArrayList<Callsheet> optionalToCollection = new ArrayList<>();
        Collection<Callsheet> callsheets = null;
        LocalDate parsedSearchDate = null;
        LocalDate parsedSearchDateStart = null;
        LocalDate parsedSearchDateEnd = null;
        boolean isAdmin = false;
        if (request.getSession().getAttribute("userrestrictions").equals("admin")) isAdmin = true;
        Optional<User> optionalUser = userRepository.findByUsername((String) request.getSession().getAttribute("username"));
        if (optionalUser.isPresent()) user = optionalUser.get();
        System.out.println(user);
        Optional<Production> optionalProduction = productionRepository.findById(id);
        if (optionalProduction.isPresent()) {
            production = optionalProduction.get();
            boolean betweenSearchCondition = searchDateStart != null && searchDateEnd != null && !searchDateStart.isEmpty() && !searchDateEnd.isEmpty();
            if (isAdmin) {
                if (searchDate != null && !searchDate.isEmpty()) {
                    parsedSearchDate = LocalDate.parse(searchDate);
                    Optional<Callsheet> optionalCallsheet = callsheetRepository.findByProductionAndDateEquals(production, parsedSearchDate);
                    if (optionalCallsheet.isPresent()) {
                        optionalToCollection.add(optionalCallsheet.get());
                        callsheets = optionalToCollection;
                    }
                } else if (betweenSearchCondition) {
                    parsedSearchDateStart = LocalDate.parse(searchDateStart);
                    parsedSearchDateEnd = LocalDate.parse(searchDateEnd);
                    callsheets = callsheetRepository.findByProductionAndDateIsBetweenOrderByDate(production, parsedSearchDateStart, parsedSearchDateEnd);
                } else callsheets = callsheetRepository.findAllByProductionOrderByDate(production);
            } else {
                if (searchDate != null && !searchDate.isEmpty()) {
                    parsedSearchDate = LocalDate.parse(searchDate);
                    Optional<Callsheet> optionalCallsheet = callsheetRepository.findByProductionAndDateBeforeAndDateEqualsAndUsers(production, testDate, parsedSearchDate, user);
                    if (optionalCallsheet.isPresent()) {
                        optionalToCollection.add(optionalCallsheet.get());
                        callsheets = optionalToCollection;
                    }
                } else if (betweenSearchCondition) {
                    parsedSearchDateStart = LocalDate.parse(searchDateStart);
                    parsedSearchDateEnd = LocalDate.parse(searchDateEnd);
                    callsheets = callsheetRepository.findByProductionAndDateBeforeAndDateIsBetweenAndUsersOrderByDate(production, testDate, parsedSearchDateStart, parsedSearchDateEnd, user);
                } else
                    callsheets = callsheetRepository.findAllByProductionAndUsersAndDateBeforeOrderByDate(production, user, testDate);
            }


            Optional<Callsheet> optionalCallsheet = callsheetRepository.findByProductionAndDateEquals(production, testDate);
            if (optionalCallsheet.isPresent()) activeCallsheetId = optionalCallsheet.get().getId();
            else {
                optionalCallsheet = callsheetRepository.findFirstByProductionAndDateAfterAndDateIsBetweenOrderByDate(production, testDate, testDate, searchLimitDays);
                if (optionalCallsheet.isPresent()) activeCallsheetId = optionalCallsheet.get().getId();
            }
        }

        model.addAttribute("production", production);
        model.addAttribute("callsheets", callsheets);
        model.addAttribute("activeCallsheetId", activeCallsheetId + 1);
        model.addAttribute("searchDate", parsedSearchDate);
        model.addAttribute("searchDateStart", parsedSearchDateStart);
        model.addAttribute("searchDateEnd", parsedSearchDateEnd);
        model.addAttribute("adminPowers", isAdmin);

        return "callsheetlist";
    }

    @GetMapping("/profile")
    public String profile(HttpServletRequest request, Model model) {
        String loggedin = (String) request.getSession().getAttribute("loggedin");
        if (loggedin == null || loggedin.isEmpty()) return "redirect:/login";

        User user = null;
        Optional<User> optionalUser = userRepository.findByUsername((String) request.getSession().getAttribute("username"));
        if (optionalUser.isPresent()) user = optionalUser.get();

        model.addAttribute("user", user);
        return "/profile";
    }

    @GetMapping("/profile-edit")
    public String profileEditor(HttpServletRequest request, Model model) {
        String loggedin = (String) request.getSession().getAttribute("loggedin");
        if (loggedin == null || loggedin.isEmpty()) return "redirect:/login";

        User user = null;
        Optional<User> optionalUser = userRepository.findByUsername((String) request.getSession().getAttribute("username"));
        if (optionalUser.isPresent()) user = optionalUser.get();

        model.addAttribute("user", user);
        return "/profile-edit";
    }

    @PostMapping("/profile-edit")
    public String editProfile(@RequestParam String username,
                              @RequestParam String firstname,
                              @RequestParam String lastname,
                              @RequestParam String email,
                              @RequestParam String phonenumber,
                              HttpServletRequest request, Model model) {
        User user;
        Optional<User> optionalUser = userRepository.findByUsername((String) request.getSession().getAttribute("username"));
        if (optionalUser.isPresent()) {
            user = optionalUser.get();

            Optional<User> usernameTaken = userRepository.findByUsername(username);
            if (!usernameTaken.isPresent()) {
                user.setUsername(username);
                request.getSession().setAttribute("username", username);
            } else System.out.println("username taken");
            if (!user.getFirstName().equals(firstname)) user.setFirstName(firstname);
            if (!user.getLastName().equals(lastname)) user.setLastName(lastname);
            if (!user.getEmail().equals(email)) user.setEmail(email);
            if (!user.getPhoneNumber().equals(phonenumber)) user.setPhoneNumber(phonenumber);
            userRepository.save(user);
        }

        return "redirect:/profile";
    }

    @RequestMapping(value = "/examples/echo", method = RequestMethod.GET)
    @ResponseBody
    public String usernameCheck(@RequestParam("newUsername") String nameToCheck, HttpServletRequest request) {
        String loggedin = (String) request.getSession().getAttribute("loggedin");
        if (loggedin == null || loggedin.isEmpty()) return "redirect:/login";
        Optional<String> usernameCheck = userRepository.findAllUsernames(nameToCheck);
        if (usernameCheck.isPresent()) return "false";
        if (nameToCheck.equals("")) return "empty";
        return "true";
    }

    @RequestMapping(value = "/passwordchange/request", method = RequestMethod.GET)
    @ResponseBody
    public String passwordChangeRequest(HttpServletRequest request, @RequestParam("passCheck") String pass)
            throws NoSuchAlgorithmException {
        Optional<User> validationTest = userRepository.findByUsername((String) request.getSession().getAttribute("username"));
        if (validationTest.isPresent()) {
            String userPasswordGiven = toHexString(getSHA(pass));
            if (validationTest.get().getPassword().equals(userPasswordGiven)) {
                System.out.println("pass correct");
                return "true";
            }
        }
        return "false";
    }


    @PostMapping("/changepass")
    public String passchanger(HttpServletRequest request, @RequestParam String newPassword,@RequestParam String confirmNewPassword) throws NoSuchAlgorithmException {
        Optional<User> validationTest = userRepository.findByUsername((String) request.getSession().getAttribute("username"));
        if (validationTest.isPresent() && newPassword != null) {
            User user = validationTest.get();
            String hashedPass = toHexString(getSHA(newPassword));
            user.setPassword(hashedPass);
            userRepository.save(user);
        }
        return "redirect:/profile-edit";
    }


    @GetMapping("/user-list")
    public String userList(HttpServletRequest request, Model model) {
        String loggedin = (String) request.getSession().getAttribute("loggedin");

        if (loggedin == null || loggedin.isEmpty()) {
            return "redirect:/login";
        }

        model.addAttribute("actors", userRepository.getUsersByJobTitle("Acteur"));
        model.addAttribute("sounds", userRepository.getUsersByJobTitle("Geluid"));
        model.addAttribute("cameras", userRepository.getUsersByJobTitle("Camera"));
        model.addAttribute("directors", userRepository.getUsersByJobTitle("Director"));
        model.addAttribute("producers", userRepository.getUsersByJobTitle("Producer"));
        return "user-list";
    }

    @GetMapping("/user-list/edit-user/{id}")
    public String editUserFromList(HttpServletRequest request, Model model, @PathVariable Integer id) {
        String loggedin = (String) request.getSession().getAttribute("loggedin");

        if (loggedin == null || loggedin.isEmpty()) {
            return "redirect:/login";
        }

        User user = userRepository.findById(id).get();
        System.out.println(user);
        model.addAttribute("user", user);

        return "/edit-selected-user";
        
    }

    @PostMapping("/user-list/edit-user/{id}")
    public String editUserFromListPost(HttpServletRequest request, Model model, @PathVariable Integer id, @RequestParam String function, @RequestParam String jobTitle,
    @RequestParam String userGroup) {
        String loggedin = (String) request.getSession().getAttribute("loggedin");

        if (loggedin == null || loggedin.isEmpty()) {
            return "redirect:/login";
        }
        String button = request.getParameter("submit");
        if ("Edit".equals(button)) {
            User user;
            Optional<User> optionalUser = userRepository.findById(id);
            if (optionalUser.isPresent()) {
                System.out.println(function);
                user = optionalUser.get();
                user.setFunction(function);
                user.setJobTitle(jobTitle);
                user.setUserRestrictions(userGroup);
                userRepository.save(user);
                System.out.println("hey i run");
            }
        } else if ("Delete User".equals(button)) {
            User user;
            Optional<User> optionalUser = userRepository.findById(id);
            if (optionalUser.isPresent()) {
                user = optionalUser.get();
                userRepository.deleteById(id);
            }
        }
        return "redirect:/user-list";
        
    }

    @GetMapping("/test")
    public String test(Model model) {
        return "/testFile";
    }
}
