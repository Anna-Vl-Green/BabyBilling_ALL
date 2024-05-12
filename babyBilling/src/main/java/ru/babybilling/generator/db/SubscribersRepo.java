package ru.babybilling.generator.db;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Поиск Абонента по MSISDN
 */
@Repository
public interface SubscribersRepo extends JpaRepository<Subscribers, Integer> {
    Subscribers findByMsisdn(String msisdn);
}
