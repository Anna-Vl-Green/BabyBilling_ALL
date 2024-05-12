package ru.bootcamp.brt.web.client;


import org.springframework.web.bind.annotation.PostMapping;
import ru.bootcamp.brt.web.model.SubscriberPayDto;
import ru.bootcamp.brt.web.model.SubscriberUpgradeDto;

public interface BrtClient {
    @PostMapping(value = "/subscriber/pay", consumes = "application/json")
    String subscriberPay(SubscriberPayDto dto);

    @PostMapping(value = "/subscriber/auth", consumes = "application/json")
    String subscriberAuth(String msisdn);

    @PostMapping(value = "/subscriber/changetariff", consumes = "application/json")
    String subscriberUpgrade(SubscriberUpgradeDto dto);

    @PostMapping(value = "/subscriber/save", consumes = "application/json")
    String subscriberCreate(SubscriberUpgradeDto dto);
}
