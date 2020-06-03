package com.bullsheet.bullsheet.repositories;

import com.bullsheet.bullsheet.model.Callsheet;
import com.bullsheet.bullsheet.model.Production;
import com.bullsheet.bullsheet.model.User;
import org.springframework.data.repository.CrudRepository;

import java.time.LocalDate;
import java.util.Collection;
import java.util.Optional;

public interface CallsheetRepository extends CrudRepository<Callsheet, Integer> {
    Optional<Callsheet> findById(Integer id);
    Collection<Callsheet> findByUsers(User user);
    Collection<Callsheet> findAllByProductionAndDateAfter(Production production, LocalDate date);
    Optional<Callsheet> findFirstByProductionAndDateAfterAndDateIsBetweenOrderByDate(Production production, LocalDate currentDate, LocalDate currentDate2, LocalDate searchLimit);

    Collection<Callsheet> findAllByProductionOrderByDate(Production production);
    Optional<Callsheet> findByProductionAndDateEquals(Production production, LocalDate date);
    Collection<Callsheet> findByProductionAndDateIsBetweenOrderByDate(Production production, LocalDate startDate, LocalDate endDate);

    Collection<Callsheet> findAllByProductionAndUsersAndDateBeforeOrderByDate(Production production, User user, LocalDate CurrentDate);
    Optional<Callsheet> findByProductionAndDateBeforeAndDateEqualsAndUsers(Production production, LocalDate currentDate, LocalDate searchDate, User user);
    Collection<Callsheet> findByProductionAndDateBeforeAndDateIsBetweenAndUsersOrderByDate(Production production, LocalDate currentDate, LocalDate startDate, LocalDate endDate, User user);
}