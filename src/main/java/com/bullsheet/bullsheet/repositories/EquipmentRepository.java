package com.bullsheet.bullsheet.repositories;

import com.bullsheet.bullsheet.model.Callsheet;
import com.bullsheet.bullsheet.model.Equipment;
import com.bullsheet.bullsheet.model.Production;
import org.springframework.data.repository.CrudRepository;

import java.util.Collection;
import java.util.Optional;

public interface EquipmentRepository extends CrudRepository<Equipment, Integer> {
    Collection<Equipment> findByProduction(Production production);
    Optional<Equipment> findByNameEquals(String name);
    Collection<Equipment> findByCallsheets(Callsheet callsheet);
}
