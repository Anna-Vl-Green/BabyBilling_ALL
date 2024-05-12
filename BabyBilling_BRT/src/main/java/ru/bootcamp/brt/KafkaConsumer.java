package ru.bootcamp.brt;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;
import ru.bootcamp.brt.model.CdrPlus;
import ru.bootcamp.brt.model.CostCalc;
import ru.bootcamp.brt.model.MonthlyFee;
import ru.bootcamp.brt.service.MonthService;
import ru.bootcamp.brt.service.MsisdnService;
import ru.bootcamp.brt.service.WithdrawService;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneOffset;


@RequiredArgsConstructor
@Service
public class KafkaConsumer {
    private final MsisdnService msisdnService;
    private final ObjectMapper mapper;
    private final WithdrawService withdrawService;
    private final MonthService monthService;

    /** Листнер сообщений ОТ CDRg топика "cdr_events".
     * @param in входное сообщение.
     */
    @KafkaListener(id = "listenCdr", topics = "cdr_events")
    public void listenCdr(String in) {
        System.out.println(in);
        String[] cdrLine = in.split("\n");
        for (String part : cdrLine) {
            var cdrPlus = new CdrPlus();
            String[] parts = part.split(",");
            cdrPlus.setTariffId(0);
            cdrPlus.setMsisdn(Long.parseLong(parts[1]));
            cdrPlus.setSecondMsisdn(Long.parseLong(parts[2]));
            cdrPlus.setAmountMinutes(0);
            cdrPlus.setType(Integer.valueOf(parts[0]));
            cdrPlus.setIsToStranger(false);
            cdrPlus.setStartTime(LocalDateTime.ofEpochSecond(Long.parseLong(parts[3]), 0, ZoneOffset.UTC));
            cdrPlus.setEndTime(LocalDateTime.ofEpochSecond(Long.parseLong(parts[4]), 0, ZoneOffset.UTC));
            msisdnService.checkMsisdn(cdrPlus);
            monthService.checkMonth(cdrPlus.getStartTime());
        }
    }

    /** Листенер сообщений топика "monthly_fee_events"
     * @param in входное сообщение.
     * @throws JsonProcessingException
     */
    @KafkaListener(id = "listenMonthlyFee", topics = "monthly_fee_events")
    public void listenMonthlyFee(String in) throws JsonProcessingException {
        System.out.println(in);
        var monthlyFee = mapper.readValue(in, MonthlyFee.class);
        monthService.offsMonthlyFee(monthlyFee);
    }

    /**
     * @param in входное сообщение.
     * @throws IOException
     */
    @KafkaListener(id = "listenWithdraw", topics = "withdraw_events")
    public void listenWithdraw(String in) throws IOException {
        System.out.println(in);
        var costCalc = mapper.readValue(in, CostCalc.class);
        withdrawService.calc(costCalc);
    }
}