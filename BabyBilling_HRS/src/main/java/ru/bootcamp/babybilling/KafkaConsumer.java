package ru.bootcamp.babybilling;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;
import ru.bootcamp.babybilling.model.CdrPlus;
import ru.bootcamp.babybilling.service.TariffService;

import java.util.List;

@RequiredArgsConstructor
@Service
public class KafkaConsumer {
    private final ObjectMapper mapper;
    private final TariffService tariffService;

    @KafkaListener(id = "listenTariff", topics = "tariff_events")
    public void listenTariff(String in) throws JsonProcessingException {
        System.out.println(in);
        var tariffs = mapper.readValue(in, new TypeReference<List<Integer>>() {
        });
        tariffService.processTariff(tariffs);

    }

    @KafkaListener(id = "listenCall", topics = "call_events")
    public void listenCall(String in) throws JsonProcessingException {
        System.out.println(in);
        var cdrPlus = mapper.readValue(in, CdrPlus.class);
        tariffService.estimate(cdrPlus);
    }
}
