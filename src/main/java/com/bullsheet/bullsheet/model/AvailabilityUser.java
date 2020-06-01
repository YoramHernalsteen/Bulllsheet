package com.bullsheet.bullsheet.model;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
public class AvailabilityUser {

    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "userAvailability_generator")
    @SequenceGenerator(name = "userAvailability_generator", sequenceName = "userAvailability_seq",
            initialValue = 0, allocationSize = 1)

    @Id
    private Integer id;
    private LocalDate date;
    private Boolean available;
    @ManyToOne(fetch = FetchType.LAZY)
    private User user;

    public AvailabilityUser() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "AvailabilityUser{" +
                "id=" + id +
                ", date=" + date +
                ", available=" + available +
                ", user=" + user +
                '}';
    }
}
