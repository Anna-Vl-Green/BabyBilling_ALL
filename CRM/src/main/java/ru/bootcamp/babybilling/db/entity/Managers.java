package ru.bootcamp.babybilling.db.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Сущность менеджера
 */
@Entity
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Managers {
    @Id
    @Column(name = "id")
    private Integer id;
    @Column(name = "username")
    private String username;
    @Column(name = "password")
    private String password;
}