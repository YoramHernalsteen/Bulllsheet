package com.bullsheet.bullsheet.repositories;

import com.bullsheet.bullsheet.model.Callsheet;
import com.bullsheet.bullsheet.model.DayPlanning;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.time.LocalTime;
import java.util.Collection;
import java.util.Optional;

public interface DayPlanningRepository extends CrudRepository<DayPlanning, Integer> {
    Collection<DayPlanning> findByCallsheet(Callsheet callsheet);
    Collection<DayPlanning> deleteByCallsheet(Callsheet callsheet);

    @Query("SELECT p FROM DayPlanning p WHERE " +
            "(:huidigeTijd < p.timeEnd and :huidigeTijd >= p.timeStart) and" +
            ":id = p.callsheet.id")
    Optional<DayPlanning> findByCallsheetAndTimeBetween(@Param("huidigeTijd") LocalTime tijd,
                                                        @Param("id") Integer id);

    @Query("SELECT p FROM DayPlanning p WHERE p.timeStart = " +
            "(SELECT min(a.timeStart) FROM DayPlanning a WHERE :callsheet = p.callsheet)")
    Optional<DayPlanning> findEarliestTime(@Param("callsheet") Callsheet callsheet);

    @Query("SELECT p FROM DayPlanning p WHERE p.timeEnd = " +
            "(SELECT max(a.timeEnd) FROM DayPlanning a WHERE :callsheet = p.callsheet)")
    Optional<DayPlanning> findLatestTime(@Param("callsheet") Callsheet callsheet);
}
