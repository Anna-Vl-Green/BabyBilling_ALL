package ru.bootcamp.brt.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import ru.bootcamp.brt.db.Subscribers;
import ru.bootcamp.brt.db.SubscribersRepo;
import ru.bootcamp.brt.model.CdrPlus;
import ru.bootcamp.brt.producer.KafkaProducer;

@Slf4j
@RequiredArgsConstructor
@Service
public class MsisdnService {

    private final SubscribersRepo repo;
    private final KafkaProducer producer;
    private final ObjectMapper mapper;

    /** Проверка звонковой записи на внутренний звонок и отправка сообщения о звонке.
     * @param cdrPlus Сущность звонка абонента "Ромашка".
     */
    public void checkMsisdn(CdrPlus cdrPlus) {
        Subscribers subFirst = repo.findByMsisdn(cdrPlus.getMsisdn().toString());
        Subscribers subSecond = repo.findByMsisdn(cdrPlus.getSecondMsisdn().toString());
        if (subFirst != null) {
            cdrPlus.setTariffId(subFirst.getTariffId());
            cdrPlus.setAmountMinutes(subFirst.getBalanceMinutes());
            cdrPlus.setIsToStranger(subSecond == null);
            try {
                producer.sendMessageCall(mapper.writeValueAsString(cdrPlus));
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        }
    }
}
