package com.bullsheet.bullsheet.repositories;

import com.bullsheet.bullsheet.model.Production;
import com.bullsheet.bullsheet.model.User;

import org.apache.xmlbeans.impl.xb.xsdschema.Attribute.Use;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Collection;
import java.util.Optional;

public interface ProductionRepository extends CrudRepository <Production, Integer> {
    Optional<Production> findById(Integer id);
    Collection<Production> findByUsers(User user);
}
