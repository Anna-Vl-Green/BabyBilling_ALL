package ru.bootcamp.brt.model;

import lombok.Data;

/**
 * Сущность ежемесечной оплаты
 */
@Data
public class MonthlyFee {
    private Integer tariffId;
    private Integer minutesAmount;
    private Float cost;
}
