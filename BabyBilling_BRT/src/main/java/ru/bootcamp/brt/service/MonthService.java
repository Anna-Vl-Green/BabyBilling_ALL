package ru.bootcamp.brt.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ru.bootcamp.brt.db.SubscribersRepo;
import ru.bootcamp.brt.model.MonthlyFee;
import ru.bootcamp.brt.producer.KafkaProducer;

import java.time.LocalDateTime;
import java.util.HashMap;

@Service
@RequiredArgsConstructor
public class MonthService {

    private final SubscribersRepo repo;
    private final ObjectMapper mapper;
    private final KafkaProducer producer;
    private final RandomService randomService;

    public void checkMonth(LocalDateTime startTime) {
        var currentMonth = LocalDateTime.now().getMonthValue();
        var month = startTime.getMonthValue();
        if (month > currentMonth) {
            var subscribers = repo.findAll();
            var tariffsIds = new HashMap<>();
            for (var t : subscribers) {
                tariffsIds.put(t.getTariffId(), t);
            }
            try {
                var json = mapper.writeValueAsString(tariffsIds.keySet());
                producer.sendMessageTariff(json);
            } catch (JsonProcessingException e) {
                throw new RuntimeException(e);
            }

            randomService.randomChange();
        }
    }

    public void offsMonthlyFee(MonthlyFee monthlyFee) {
        var subscribers = repo.findByTariffId(monthlyFee.getTariffId());
        for (var s : subscribers) {
            s.setBalanceMinutes(monthlyFee.getMinutesAmount());
            s.setBalance(s.getBalance() - monthlyFee.getCost());
            repo.save(s);
        }
    }
}
