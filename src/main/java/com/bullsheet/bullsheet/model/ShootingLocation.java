package com.bullsheet.bullsheet.model;

import javax.persistence.*;

@Entity
public class ShootingLocation {

    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "shootingLocation_generator")
    @SequenceGenerator(name = "shootingLocation_generator", sequenceName = "shootingLocation_seq",
            initialValue = 0, allocationSize = 1)

    @Id
    private Integer id;
    private String name;
    private String adres;
    private String zipcode;
    private String city;
    private String type;
    private String extraInfo;
    @ManyToOne(fetch = FetchType.LAZY)
    ProductionCompany productionCompany;


    public ShootingLocation() {
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getExtraInfo() {
        return extraInfo;
    }

    public void setExtraInfo(String extraInfo) {
        this.extraInfo = extraInfo;
    }

    public ProductionCompany getProductionCompany() {
        return productionCompany;
    }

    public void setProductionCompany(ProductionCompany productionCompany) {
        this.productionCompany = productionCompany;
    }

    @Override
    public String toString() {
        return "ShootingLocation{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", adres='" + adres + '\'' +
                ", zipcode='" + zipcode + '\'' +
                ", city='" + city + '\'' +
                ", type='" + type + '\'' +
                ", productionCompany=" + productionCompany +
                '}';
    }
}
