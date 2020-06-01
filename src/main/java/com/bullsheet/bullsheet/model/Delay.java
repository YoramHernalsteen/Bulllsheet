package com.bullsheet.bullsheet.model;

import javax.persistence.*;
import java.time.LocalTime;

@Entity
public class Delay {
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "delay_generator")
    @SequenceGenerator(name = "delay_generator", sequenceName = "delay_seq",
            initialValue = 0, allocationSize = 1)

    @Id
    private Integer id;
    private String reason;
    private int delayDuration;
    private LocalTime time;
    @ManyToOne(fetch = FetchType.LAZY)
    private Callsheet callsheet;

    public Delay() {
    }

    public Integer getId() {
        return id;
    }

    public String getReason() {
        return reason;
    }

    public Callsheet getCallsheet() {
        return callsheet;
    }

    public int getDelayDuration() {
        return delayDuration;
    }

    public LocalTime getTime() {
        return time;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setReason(String report) {
        this.reason = report;
    }

    public void setCallsheet(Callsheet callsheet) {
        this.callsheet = callsheet;
    }

    public void setDelayDuration(int delayDuration) {
        this.delayDuration = delayDuration;
    }

    public void setTime(LocalTime time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "delay{" +
                "id= " + id +
                "reason =" + reason +
                ", callsheet=" + callsheet +
                '}';
    }
}
