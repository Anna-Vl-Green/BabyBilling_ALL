package ru.bootcamp.babybilling.model;

import lombok.Data;

/**
 * Сущность изменения тарифа
 */
@Data
public class SubscriberUpgradeDto {
    private String msisdn;
    private Integer tariff;
    private Integer money;
}
