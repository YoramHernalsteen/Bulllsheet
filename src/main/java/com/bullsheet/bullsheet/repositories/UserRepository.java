package com.bullsheet.bullsheet.repositories;

import com.bullsheet.bullsheet.model.Callsheet;
import com.bullsheet.bullsheet.model.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;


public interface UserRepository extends CrudRepository<User, Integer> {
    List<User> findByFunctionAndCallsheets(String function, Callsheet callsheet);
    Optional<User> findByFirstNameAndLastName(String firstName, String lastName);
    Iterable<User> findByCallsheets(Callsheet callsheet);
    Optional<User> findByUsername(String username);


    @Query("SELECT u.username FROM User u where u.username = :name")
    Optional<String> findAllUsernames(@Param("name") String name);

    List<User> getUsersByJobTitle(String jobTitle);
}
