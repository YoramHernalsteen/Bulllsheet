package com.bullsheet.bullsheet.model;

import javax.persistence.*;
import java.util.Collection;

@Entity
public class Production {

    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "production_generator")
    @SequenceGenerator(name = "production_generator", sequenceName = "production_seq",
            initialValue = 0, allocationSize = 1)
    @Id
    private Integer id;
    private String name;
    private String description;
    @ManyToMany(mappedBy = "production")
    private Collection<User> users;
    @ManyToOne
    private ProductionCompany productionCompany;

    public Production() {
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Collection<User> getUsers() {
        return users;
    }

    public void setUsers(Collection<User> users) {
        this.users = users;
    }

    public ProductionCompany getProductionCompany() {
        return productionCompany;
    }

    public void setProductionCompany(ProductionCompany productionCompany) {
        this.productionCompany = productionCompany;
    }

    @Override
    public String toString() {
        return "Production{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", productionCompany=" + productionCompany +
                '}';
    }
}
