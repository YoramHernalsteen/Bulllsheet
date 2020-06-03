package com.bullsheet.bullsheet.model;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Collection;
import java.util.Date;

@Entity
public class Callsheet {

    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "callsheet_generator")
    @SequenceGenerator(name = "callsheet_generator", sequenceName = "callsheet_seq",
            initialValue = 0, allocationSize = 1)
    @Id
    private Integer id;
    private java.time.LocalDate date;
    private java.time.LocalTime calltime;
    @ManyToOne(fetch = FetchType.LAZY)
    private Production production;
    @ManyToOne(fetch = FetchType.LAZY)
    private ProductionCompany productionCompany;
    @ManyToOne(fetch = FetchType.LAZY)
    private ShootingLocation shootingLocation;
    @ManyToMany(fetch = FetchType.LAZY)
    private Collection<User> users;
    @ManyToMany(fetch = FetchType.LAZY)
    private Collection<Equipment> equipment;
    @ManyToMany(fetch = FetchType.LAZY)
    private Collection<ShootingLocation> additionalLocations;


    public Callsheet() {
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

    public LocalTime getCalltime() {
        return calltime;
    }

    public Date convertToDateViaSqlDate(LocalDate dateToConvert) {
        return java.sql.Date.valueOf(dateToConvert);
        //nodig omdat de excel API enkel Date kan lezen
    }

    public String getDateAsString() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MMM-dd");
        return (date != null) ? formatter.format(this.convertToDateViaSqlDate(date)) : "";
    }

    public void setCalltime(LocalTime calltime) {
        this.calltime = calltime;
    }

    public Production getProduction() {
        return production;
    }

    public void setProduction(Production production) {
        this.production = production;
    }

    public ProductionCompany getProductionCompany() {
        return productionCompany;
    }

    public void setProductionCompany(ProductionCompany productionCompany) {
        this.productionCompany = productionCompany;
    }

    public ShootingLocation getShootingLocation() {
        return shootingLocation;
    }

    public void setShootingLocation(ShootingLocation shootingLocation) {
        this.shootingLocation = shootingLocation;
    }

    public Collection<User> getUsers() {
        return users;
    }

    public void setUsers(Collection<User> users) {
        this.users = users;
    }

    public Collection<Equipment> getEquipment() {
        return equipment;
    }

    public void setEquipment(Collection<Equipment> equipment) {
        this.equipment = equipment;
    }

    public Collection<ShootingLocation> getAdditionalLocations() {
        return additionalLocations;
    }

    public void setAdditionalLocations(Collection<ShootingLocation> additionalLocations) {
        this.additionalLocations = additionalLocations;
    }

    @Override
    public String toString() {
        return "Callsheet{" +
                "id=" + id +
                ", date=" + date +
                ", calltime=" + calltime +
                ", production=" + production +
                ", shootingLocation=" + shootingLocation +
                '}';
    }
}
