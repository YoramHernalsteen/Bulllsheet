package com.bullsheet.bullsheet.repositories;

import com.bullsheet.bullsheet.model.Callsheet;
import com.bullsheet.bullsheet.model.Delay;
import com.bullsheet.bullsheet.model.Note;
import org.springframework.data.repository.CrudRepository;

import java.util.Collection;

public interface NoteRepository extends CrudRepository<Note, Integer> {
    Collection<Note> findByCallsheet(Callsheet callsheet);
}
