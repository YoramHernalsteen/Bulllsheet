package com.bullsheet.bullsheet.model;

import javax.persistence.*;
import java.util.Collection;

@Entity
public class User {
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "user_generator")
    @SequenceGenerator(name = "user_generator", sequenceName = "user_seq",
            initialValue = 0, allocationSize = 1)

    @Id
    private Integer id;
    private String username;
    private String password;
    private String firstName;
    private String lastName;
    private String function;
    private String jobTitle;
    private String email;
    private String phoneNumber;
    private String userRestrictions; //plain user or admin rights
    @ManyToMany(fetch = FetchType.LAZY)
    private Collection<Production> production;
    @ManyToMany(fetch = FetchType.LAZY)
    private Collection<ProductionCompany> productionCompany;
    @ManyToMany(mappedBy = "users")
    private Collection<Callsheet> callsheets;

    public User() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstname) {
        this.firstName = firstname;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastname) {
        this.lastName = lastname;
    }

    public String getFunction() {
        return function;
    }

    public void setFunction(String jobtitle) {
        this.function = jobtitle;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phonenumber) {
        this.phoneNumber = phonenumber;
    }

    public String getUserRestrictions() {
        return userRestrictions;
    }

    public void setUserRestrictions(String userRestrictions) {
        this.userRestrictions = userRestrictions;
    }

    public Collection<Production> getProduction() {
        return production;
    }

    public void setProduction(Collection<Production> production) {
        this.production = production;
    }

    public Collection<ProductionCompany> getProductionCompany() {
        return productionCompany;
    }

    public void setProductionCompany(Collection<ProductionCompany> productionCompany) {
        this.productionCompany = productionCompany;
    }

    public Collection<Callsheet> getCallsheets() {
        return callsheets;
    }

    public void setCallsheets(Collection<Callsheet> callsheets) {
        this.callsheets = callsheets;
    }

    public boolean registerValidationEmptyCheck() {
        return !username.isEmpty() && !password.isEmpty() && !firstName.isEmpty() && !lastName.isEmpty() && !email.isEmpty() && !phoneNumber.isEmpty();
    }

    public boolean loginValidationEmptyCheck() {
        return !username.isEmpty() && !password.isEmpty();
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", function='" + function + '\'' +
                ", jobTitle='" + jobTitle + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", userRestrictions='" + userRestrictions + '\'' +
                '}';
    }
}
