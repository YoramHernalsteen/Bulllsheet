package com.bullsheet.bullsheet.model;

import javax.persistence.*;
import java.util.Collection;

@Entity
public class Equipment {

    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "equipment_generator")
    @SequenceGenerator(name = "equipment_generator", sequenceName = "equipment_seq",
            initialValue = 0, allocationSize = 1)

    @Id
    private Integer id;
    private String type;
    private String name;
    private String specifications;
    @ManyToOne(fetch = FetchType.LAZY)
    private ProductionCompany productionCompany;
    @ManyToOne(fetch = FetchType.LAZY)
    private Production production;
    @ManyToMany(mappedBy = "equipment")
    private Collection<Callsheet> callsheets;

    public Equipment() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSpecifications() {
        return specifications;
    }

    public void setSpecifications(String specifications) {
        this.specifications = specifications;
    }

    public ProductionCompany getProductionCompany() {
        return productionCompany;
    }

    public void setProductionCompany(ProductionCompany productionCompany) {
        this.productionCompany = productionCompany;
    }

    public Production getProduction() {
        return production;
    }

    public void setProduction(Production production) {
        this.production = production;
    }

    public Collection<Callsheet> getCallsheets() {
        return callsheets;
    }

    public void setCallsheets(Collection<Callsheet> callsheets) {
        this.callsheets = callsheets;
    }

    @Override
    public String toString() {
        return "Equipment{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", name='" + name + '\'' +
                ", specifications='" + specifications + '\'' +
                ", productionCompany=" + productionCompany +
                ", production=" + production +
                '}';
    }
}
