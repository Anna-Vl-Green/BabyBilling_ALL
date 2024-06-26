package ru.bootcamp.brt.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ru.bootcamp.brt.db.SubscribersRepo;

import static java.util.concurrent.ThreadLocalRandom.current;

/**
 * Сервис рандомизации имитации
 */
@Service
@RequiredArgsConstructor
public class RandomService {
    private final SubscribersRepo repo;

    /**
     * Рандомизация действий абонентов по внесению платы и смене тарифа.
     */
    public void randomChange() {
        var subs = repo.findAll();
        for (var s : subs) {
            var randomPay = current().nextInt(100, 401);
            s.setBalance(s.getBalance() + randomPay);
            if (s.getTariffId() == 12) {
                s.setBalance(s.getBalance() - 100);
                s.setBalanceMinutes((s.getBalanceMinutes() + 100));
            }
            repo.save(s);
        }

        var randomSubsCount = current().nextInt(1, 4);
        if (subs.size() > randomSubsCount) {
            for (int i = 0; i < randomSubsCount; i++) {
                var sub = subs.get(i);
                if (sub.getTariffId() == 11) {
                    sub.setTariffId(12);
                    sub.setBalanceMinutes(100);
                } else {
                    sub.setTariffId(11);
                    sub.setBalance((sub.getBalance()) - 100);
                }
                repo.save(sub);
            }
        }
    }
}
