package com.bullsheet.bullsheet.model;

import javax.persistence.*;

@Entity
public class Note {
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "note_generator")
    @SequenceGenerator(name = "note_generator", sequenceName = "note_seq",
            initialValue = 0, allocationSize = 1)

    @Id
    private Integer id;
    private String noteText;
    @ManyToOne(fetch = FetchType.LAZY)
    private Callsheet callsheet;

    public Note() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNoteText() {
        return noteText;
    }

    public void setNoteText(String noteText) {
        this.noteText = noteText;
    }

    public Callsheet getCallsheet() {
        return callsheet;
    }

    public void setCallsheet(Callsheet callsheet) {
        this.callsheet = callsheet;
    }
}
