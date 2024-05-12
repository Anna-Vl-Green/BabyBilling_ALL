package ru.bootcamp.babybilling.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import ru.bootcamp.babybilling.db.TariffsRepo;
import ru.bootcamp.babybilling.model.CdrPlus;
import ru.bootcamp.babybilling.model.CostCalc;
import ru.bootcamp.babybilling.producer.KafkaProducer;

import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Сервис работы с тарифами
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class TariffService {
    private final KafkaProducer producer;
    private final TariffsRepo repo;
    private final ObjectMapper mapper;

    /** Выгрузка деталей по тарифам и отправка их в Kafka
     * @param tariffsList список тарифов
     * @throws JsonProcessingException
     */
    public void processTariff(List<Integer> tariffsList) throws JsonProcessingException {
        for (var t : tariffsList) {
            var tariff = repo.findById(t);
            if (tariff.isPresent()) {
                var details = tariff.get().getDetails();
                for (var d : details) {
                    if (d.getType().equalsIgnoreCase("minutesAmount")) {
                        var json = mapper.writeValueAsString(tariff.get());
                        producer.sendMessageMonthlyFee(json);
                    }
                }
            }
        }
    }


    public void estimate(CdrPlus cdrPlus) throws JsonProcessingException {
        var callTime = Math.ceil(ChronoUnit.MINUTES.between(cdrPlus.getStartTime(), cdrPlus.getEndTime()));
        log.info("Длительность звонка - {}", callTime);
        var tariff = repo.findById(cdrPlus.getTariffId());
        log.info("Тариф абонента - {}", tariff.get().getName());
        var costCalc = new CostCalc();
        costCalc.setMsisdn(cdrPlus.getMsisdn());
        costCalc.setMinutesCost(0);
        if (tariff.isPresent()) {
            var details = tariff.get().getDetails();
            Map<String, Integer> detailsMap = new HashMap<>();
            for (var d : details) {
                detailsMap.put(d.getType(), d.getValue());
            }
            if (detailsMap.containsKey("outgoingCost")) {
                var incomingCost = detailsMap.get("incomingCost");
                log.info("Стоимость входящего звонка от абонента другого оператора - {}", incomingCost);
                var incomingCostForSubs = detailsMap.get("incomingCostForSubs");
                log.info("Стоимость входящего звонка от абонента оператора 'Ромашка' - {}", incomingCostForSubs);
                var outgoingCost = detailsMap.get("outgoingCost");
                log.info("Стоимость исходящего звонка абоненту другого оператора - {}", outgoingCost);
                var outgoingCostForSubs = detailsMap.get("outgoingCostForSubs");
                log.info("Стоимость исходящего звонка абоненту оператора 'Ромашка' - {}", outgoingCostForSubs);
                if (cdrPlus.getType() == 01) {
                    log.info("Тип звонка - входящий");
                    if (cdrPlus.getIsToStranger()) {
                        log.info("Звонок от абонента другого оператора");
                        costCalc.setCost((float) (callTime * incomingCost));
                        log.info("Стоимость звонка - {}", costCalc.getCost());
                    } else {
                        log.info("Звонок от абонента оператора 'Ромашка'");
                        costCalc.setCost((float) (callTime * incomingCostForSubs));
                        log.info("Стоимость звонка - {}", costCalc.getCost());
                    }
                } else {
                    log.info("Тип звонка - исходящий");
                    if (cdrPlus.getIsToStranger()) {
                        log.info("Звонок осуществлялся абоненту другого оператора");
                        costCalc.setCost((float) (callTime * outgoingCost));
                        log.info("Стоимость звонка - {}", costCalc.getCost());
                    } else {
                        log.info("Звонок осуществлялся абоненту оператора 'Ромашка'");
                        costCalc.setCost((float) (callTime * outgoingCostForSubs));
                        log.info("Стоимость звонка - {}", costCalc.getCost());
                    }
                }
                try {
                    var json = mapper.writeValueAsString(costCalc);
                    costCalc.setMinutesCost(0);
                    producer.sendMessageWithdraw(json);
                } catch (JsonProcessingException e) {
                    e.printStackTrace();

                }

            } else {
                var amountMinutes = cdrPlus.getAmountMinutes();
                log.info("Остаток минут - {}", amountMinutes);
                if (amountMinutes > callTime) {
                    costCalc.setMsisdn(cdrPlus.getMsisdn());
                    costCalc.setCost((float) 0);
                    log.info("Стоимость звонка - 0");
                    costCalc.setMinutesCost((int) callTime);
                    var json = mapper.writeValueAsString(costCalc);
                    producer.sendMessageWithdraw(json);
                } else {
                    var remainsMinutes = callTime - amountMinutes;
                    log.info("Длительность звонка больше остатка минут на счёте абонента. {} минут будут посчитаны по тарифу 'Классика'", remainsMinutes);
                    var tariffClassic = repo.findById(11);
                    var detailsClassic = tariffClassic.get().getDetails();
                    log.info("Детали тарифа - {}", detailsClassic);
                    Map<String, Integer> detailsClassicMap = new HashMap<>();
                    for (var c : detailsClassic) {
                        detailsClassicMap.put(c.getType(), c.getValue());
                    }
                    if (cdrPlus.getType() == 02) {
                        log.info("Исходящий звонок");
                        log.info("{}", detailsMap);
                        var outgoingCost = detailsClassicMap.get("outgoingCost");
                        log.info("Цена исходящего вызова - {} за 1 минуту", detailsClassicMap.get("outgoingCost"));
                        costCalc.setMsisdn(cdrPlus.getMsisdn());
                        log.info("Номер абонента {}", costCalc.getMsisdn());
                        costCalc.setCost((float) remainsMinutes * (float) outgoingCost);
                        log.info("Стоимость вызова - {}", costCalc.getCost());
                        costCalc.setMinutesCost(amountMinutes);
                        log.info("Количество списанных минут - {}", costCalc.getMinutesCost());
                        var json = mapper.writeValueAsString(costCalc);
                        log.info("Стоимость вызова - {}", json);
                        producer.sendMessageWithdraw(json);
                    }
                }
            }
        }
    }
}
