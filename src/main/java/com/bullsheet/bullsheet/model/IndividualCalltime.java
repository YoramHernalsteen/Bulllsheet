package com.bullsheet.bullsheet.model;


import javax.persistence.*;
import java.time.LocalTime;

@Entity
public class IndividualCalltime {

    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "individual_generator")
    @SequenceGenerator(name = "individual_generator", sequenceName = "individual_seq",
            initialValue = 0, allocationSize = 1)

    @Id
    private Integer id;
    private LocalTime calltime;
    @ManyToOne
    private Callsheet callsheet;
    @OneToOne
    private User user;

    public IndividualCalltime() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public LocalTime getCalltime() {
        return calltime;
    }

    public void setCalltime(LocalTime calltime) {
        this.calltime = calltime;
    }

    public Callsheet getCallsheet() {
        return callsheet;
    }

    public void setCallsheet(Callsheet callsheet) {
        this.callsheet = callsheet;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "IndividualCalltime{" +
                "id=" + id +
                ", calltime=" + calltime +
                ", callsheet=" + callsheet +
                ", user=" + user +
                '}';
    }
}