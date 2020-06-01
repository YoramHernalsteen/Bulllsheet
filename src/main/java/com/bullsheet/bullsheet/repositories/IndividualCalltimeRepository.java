package com.bullsheet.bullsheet.repositories;

import com.bullsheet.bullsheet.model.Callsheet;
import com.bullsheet.bullsheet.model.IndividualCalltime;
import org.springframework.data.repository.CrudRepository;

import java.util.Collection;
import java.util.Optional;

public interface IndividualCalltimeRepository extends CrudRepository<IndividualCalltime, Integer> {
    Collection<IndividualCalltime> findByCallsheet(Callsheet callsheet);
    Optional<IndividualCalltime>findById(Integer id);
    Iterable<IndividualCalltime>deleteByCallsheet(Callsheet callsheet);
}
