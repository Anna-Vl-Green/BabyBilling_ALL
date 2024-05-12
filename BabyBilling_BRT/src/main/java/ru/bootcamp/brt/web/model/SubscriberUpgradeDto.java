package ru.bootcamp.brt.web.model;

import lombok.Data;

@Data
public class SubscriberUpgradeDto {
    private String msisdn;
    private Integer tariff;
    private Integer money;
}
