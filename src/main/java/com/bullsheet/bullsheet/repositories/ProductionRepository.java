package com.bullsheet.bullsheet.repositories;

import com.bullsheet.bullsheet.model.Production;
import com.bullsheet.bullsheet.model.User;
import org.springframework.data.repository.CrudRepository;

import java.util.Collection;
import java.util.Optional;

public interface ProductionRepository extends CrudRepository <Production, Integer> {
 Optional<Production> findById(Integer id);
 Collection<Production> findByUsers(User user);
}
