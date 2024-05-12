package ru.bootcamp.babybilling.db.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.bootcamp.babybilling.db.entity.Managers;

@Repository
public interface ManagersRepo extends JpaRepository<Managers, Integer> {
    Managers findByUsername(String username);
}
