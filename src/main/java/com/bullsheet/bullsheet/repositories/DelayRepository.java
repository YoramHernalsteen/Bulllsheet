package com.bullsheet.bullsheet.repositories;

import com.bullsheet.bullsheet.model.Callsheet;
import com.bullsheet.bullsheet.model.Delay;
import org.springframework.data.repository.CrudRepository;

import java.util.Collection;

public interface DelayRepository extends CrudRepository<Delay, Integer> {
    Collection<Delay> findByCallsheet(Callsheet callsheet);
}
