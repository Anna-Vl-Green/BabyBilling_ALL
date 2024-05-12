package ru.babybilling.generator.db;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * интерфейс работы с репозиторием Calls
 */
@ComponentScan
@Repository
public interface CallsRepo extends JpaRepository<Calls, Integer> {
}
