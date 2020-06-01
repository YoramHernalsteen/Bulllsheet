package com.bullsheet.bullsheet.model;

import javax.persistence.*;
import java.util.Collection;

@Entity
public class ProductionCompany {
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "productionCompany_generator")
    @SequenceGenerator(name = "productionCompany_generator", sequenceName = "productionCompany_seq",
            initialValue = 0, allocationSize = 1)

    @Id
    private Integer id;
    private String name;
    private String adres;
    private String zipcode;
    private String city;
    private String phonenumber;
    @ManyToMany(mappedBy = "productionCompany")
    private Collection<User> users;

    public ProductionCompany() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAdres() {
        return adres;
    }

    public void setAdres(String adres) {
        this.adres = adres;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public Collection<User> getUsers() {
        return users;
    }

    public void setUsers(Collection<User> users) {
        this.users = users;
    }

    @Override
    public String toString() {
        return "ProductionCompany{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", adres='" + adres + '\'' +
                ", zipcode='" + zipcode + '\'' +
                ", city='" + city + '\'' +
                '}';
    }
}
