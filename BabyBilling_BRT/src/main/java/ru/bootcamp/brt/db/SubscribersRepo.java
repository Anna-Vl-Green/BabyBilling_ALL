package ru.bootcamp.brt.db;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Интерфейс работы с таблицей Абонентов
 */
@Repository
public interface SubscribersRepo extends JpaRepository<Subscribers, Integer> {
    Subscribers findByMsisdn(String msisdn);
    List<Subscribers> findByTariffId(Integer tariffId);
}
