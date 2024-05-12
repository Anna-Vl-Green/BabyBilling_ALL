package ru.bootcamp.brt.web.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ru.bootcamp.brt.db.Subscribers;
import ru.bootcamp.brt.db.SubscribersRepo;
import ru.bootcamp.brt.web.model.SubscriberPayDto;
import ru.bootcamp.brt.web.model.SubscriberUpgradeDto;

@Service
@RequiredArgsConstructor
public class WebService {
    private final SubscribersRepo repo;

    public Boolean auth(String msisdn) {
        var sub = repo.findByMsisdn(msisdn);
        if (sub != null) {
            return true;
        } else {
            return false;
        }
    }

    public void pay(SubscriberPayDto dto) {
        var sub = repo.findByMsisdn(dto.getMsisdn());
        if (sub != null) {
            sub.setBalance(sub.getBalance() + dto.getMoney().floatValue());
            repo.save(sub);
        }
    }

    public void upgrade(SubscriberUpgradeDto dto) {
        var sub = repo.findByMsisdn(dto.getMsisdn());
        if (sub != null) {
            sub.setTariffId(dto.getTariff());
            repo.save(sub);
        }
    }

    public void save(SubscriberUpgradeDto dto) {
        var sub = repo.findByMsisdn(dto.getMsisdn());
        if (sub == null) {
            sub = new Subscribers();
            sub.setBalance(dto.getMoney().floatValue());
            sub.setId((int) (repo.count() + 1));
            sub.setBalanceMinutes(0);
            sub.setTariffId(dto.getTariff());
            sub.setMsisdn(dto.getMsisdn());
            sub.setBalanceKilobytes(0);
            sub.setBalanceSms(0);
            repo.save(sub);
        }
    }
}
