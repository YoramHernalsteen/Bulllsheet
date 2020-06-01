package com.bullsheet.bullsheet.repositories;

import com.bullsheet.bullsheet.model.ShootingLocation;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface ShootingLocationRepository extends CrudRepository <ShootingLocation, Integer> {
Optional<ShootingLocation> findByNameEquals(String name);
}
