package com.bullsheet.bullsheet.model;

import javax.persistence.*;
import java.time.LocalTime;

@Entity
public class DayPlanning {

    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "planning_generator")
    @SequenceGenerator(name = "planning_generator", sequenceName = "planning_seq",
            initialValue = 0, allocationSize = 1)

    @Id
    private Integer id;
    private LocalTime timeStart;
    private LocalTime timeEnd;
    private String description;
    private String location;
    @ManyToOne(fetch = FetchType.LAZY)
    private Callsheet callsheet;

    public DayPlanning() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public LocalTime getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(LocalTime timeStart) {
        this.timeStart = timeStart;
    }

    public LocalTime getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(LocalTime timeEnd) {
        this.timeEnd = timeEnd;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Callsheet getCallsheet() {
        return callsheet;
    }

    public void setCallsheet(Callsheet callsheet) {
        this.callsheet = callsheet;
    }

    @Override
    public String toString() {
        return "DayPlanning{" +
                "id=" + id +
                ", timeStart=" + timeStart +
                ", timeEnd=" + timeEnd +
                ", description='" + description + '\'' +
                ", location='" + location + '\'' +
                ", callsheet=" + callsheet +
                '}';
    }
}
