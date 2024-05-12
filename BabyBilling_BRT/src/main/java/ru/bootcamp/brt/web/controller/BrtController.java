package ru.bootcamp.brt.web.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.bootcamp.brt.web.client.BrtClient;
import ru.bootcamp.brt.web.model.SubscriberPayDto;
import ru.bootcamp.brt.web.model.SubscriberUpgradeDto;
import ru.bootcamp.brt.web.service.WebService;

@RestController
@Slf4j
@RequiredArgsConstructor
public class BrtController implements BrtClient {
    private final WebService webService;

    @Override
    @PostMapping(value = "/subscriber/pay", consumes = "application/json")
    public String subscriberPay(SubscriberPayDto dto) {
        webService.pay(dto);
        return "OK";
    }

    @Override
    @PostMapping(value = "/subscriber/auth", consumes = "application/json")
    public String subscriberAuth(String msisdn) {
        var result = webService.auth(msisdn);
        if (result) {
            return "OK";
        }
        return "MSISDN NOT FOUND";
    }

    @Override
    @PostMapping(value = "/subscriber/changetariff", consumes = "application/json")
    public String subscriberUpgrade(SubscriberUpgradeDto dto) {
        webService.upgrade(dto);
        return "OK";
    }

    @Override
    @PostMapping(value = "/subscriber/save", consumes = "application/json")
    public String subscriberCreate(SubscriberUpgradeDto dto) {
        webService.save(dto);
        return "OK";
    }
}
