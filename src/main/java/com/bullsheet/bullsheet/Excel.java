package com.bullsheet.bullsheet;

import com.bullsheet.bullsheet.model.*;
import com.gembox.spreadsheet.ExcelFile;
import com.gembox.spreadsheet.ExcelWorksheet;
import com.gembox.spreadsheet.SpreadsheetInfo;

import java.io.IOException;
import java.util.Collection;
import java.util.Optional;

public class Excel {

    public void fillExcel(Callsheet callsheet, Collection<DayPlanning> dayPlanning, Collection<Equipment> equipment, Collection<IndividualCalltime> individualCalltimes, Collection<Delay> delay,Collection<Note> notes) throws IOException {
        SpreadsheetInfo.setLicense("FREE-LIMITED-KEY");
        ExcelFile workbook = ExcelFile.load("TemplateUse.xlsx");
        ExcelWorksheet templateSheet = workbook.getWorksheet(0);
        templateSheet.getCell(0, 1).setValue(callsheet.getProductionCompany().getName());
        templateSheet.getCell(1, 1).setValue(callsheet.getProductionCompany().getAdres());
        templateSheet.getCell(2, 1).setValue(callsheet.getProductionCompany().getPhonenumber());
        templateSheet.getCell(0, 3).setValue(callsheet.getProduction().getName());
        templateSheet.getCell(4, 3).setValue(callsheet.getDateAsString());
        templateSheet.getCell(6, 3).setValue(callsheet.getCalltime().toString());
        templateSheet.getCell(0, 6).setValue(callsheet.getShootingLocation().getName());
        templateSheet.getCell(1, 6).setValue(callsheet.getShootingLocation().getAdres());
        templateSheet.getCell(2, 6).setValue(callsheet.getShootingLocation().getCity());
        int castNr = 33;
        int crewNr = 20;
        for(IndividualCalltime ict :individualCalltimes){
            if (ict.getUser().getFunction().equals("Cast") || ict.getUser().getFunction().equals("cast")) {
                templateSheet.getCell(castNr, 0).setValue(ict.getUser().getJobTitle());
                templateSheet.getCell(castNr, 1).setValue(ict.getUser().getFirstName() + " " + ict.getUser().getLastName());
                templateSheet.getCell(castNr, 2).setValue(ict.getUser().getPhoneNumber());
                templateSheet.getCell(castNr, 3).setValue(ict.getUser().getEmail());
                templateSheet.getCell(castNr, 4).setValue(ict.getCalltime().toString());
                castNr++;

            }
            else if(ict.getUser().getFunction().equals("Crew") || ict.getUser().getFunction().equals("crew")){
                templateSheet.getCell(crewNr, 0).setValue(ict.getUser().getJobTitle());
                templateSheet.getCell(crewNr, 1).setValue(ict.getUser().getFirstName() + " "+ ict.getUser().getLastName());
                templateSheet.getCell(crewNr, 2).setValue(ict.getUser().getPhoneNumber());
                templateSheet.getCell(crewNr, 3).setValue(ict.getUser().getEmail());
                templateSheet.getCell(crewNr, 4).setValue(ict.getCalltime().toString());
                crewNr++;
            }
        }
        int additionalLocationIndex = 11;
        for(ShootingLocation s : callsheet.getAdditionalLocations()){
            templateSheet.getCell(additionalLocationIndex, 0).setValue(s.getName());
            templateSheet.getCell(additionalLocationIndex, 1).setValue(s.getAdres() + " " + s.getZipcode()+ ", " + s.getCity());
            templateSheet.getCell(additionalLocationIndex, 3).setValue(s.getType());
            templateSheet.getCell(additionalLocationIndex, 4).setValue(s.getExtraInfo());
            additionalLocationIndex++;
        }
        int dayNr = 46;
        for (DayPlanning day : dayPlanning ){
            templateSheet.getCell(dayNr, 0).setValue(day.getTimeStart().toString());
            templateSheet.getCell(dayNr, 1).setValue(day.getTimeEnd().toString());
            templateSheet.getCell(dayNr, 2).setValue(day.getLocation());
            templateSheet.getCell(dayNr, 3).setValue(day.getDescription());
            dayNr++;
        }
        int equipmentNr = 62;
        for(Equipment equipmentCallsheet: callsheet.getEquipment()){
            templateSheet.getCell(equipmentNr, 0).setValue(equipmentCallsheet.getType());
            templateSheet.getCell(equipmentNr, 2).setValue(equipmentCallsheet.getName());
            templateSheet.getCell(equipmentNr, 4).setValue(equipmentCallsheet.getSpecifications());
            equipmentNr++;
        }
        int delayNr = 80;
        for(Delay d: delay){
            templateSheet.getCell(delayNr, 0).setValue(d.getTime().toString());
            templateSheet.getCell(delayNr, 1).setValue(d.getReason());
            templateSheet.getCell(delayNr, 5).setValue(d.getDelayDuration());
            delayNr++;
        }
        int noteNr =93;

        for(Note note: notes){
            templateSheet.getCell(noteNr, 0).setValue(note.getNoteText());
            System.out.println(note.getNoteText());
            noteNr++;
        }
        workbook.save("callsheet.xlsx");
    }


}
