package ru.bootcamp.babybilling.client;


import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import ru.bootcamp.babybilling.model.SubscriberPayDto;
import ru.bootcamp.babybilling.model.SubscriberUpgradeDto;

/**
 * API-интерфейс
 */
@FeignClient(
        name = "brt-client",
        url = "${feign.svc.brt.url:}"
)
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
