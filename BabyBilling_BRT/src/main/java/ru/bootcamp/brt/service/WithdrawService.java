package ru.bootcamp.brt.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import ru.bootcamp.brt.db.SubscribersRepo;
import ru.bootcamp.brt.model.CostCalc;

@Slf4j
@Service
@RequiredArgsConstructor
public class WithdrawService {
    private final SubscribersRepo repo;

    public void calc(CostCalc costCalc) {
        var subscriber = repo.findByMsisdn(costCalc.getMsisdn().toString());
        if (subscriber != null) {
            log.info("Тариф абонента {} - {}", subscriber.getMsisdn(), subscriber.getTariffId());
            log.info("Баланс абонента - {}", subscriber.getBalance());
            log.info("Баланс минут абонента - {}", subscriber.getBalanceMinutes());
            subscriber.setBalance(subscriber.getBalance() - costCalc.getCost());
            log.info("Баланс абонента после списания - {}", subscriber.getBalance());
            subscriber.setBalanceMinutes(subscriber.getBalanceMinutes() - costCalc.getMinutesCost());
            log.info("Баланс минут абонента после списания - {}", subscriber.getBalanceMinutes());
            repo.save(subscriber);
        }
    }
}
