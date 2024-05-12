package ru.bootcamp.babybilling.db;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TariffsRepo extends JpaRepository<Tariffs, Integer> {
}
