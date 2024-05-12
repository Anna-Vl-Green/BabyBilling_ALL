package ru.bootcamp.babybilling.model;

import lombok.Data;

/**
 * Сущность внесения платежа
 */
@Data
public class SubscriberPayDto {
    private String msisdn;
    private Integer money;
}
