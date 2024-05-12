package ru.bootcamp.babybilling.model;

import lombok.Data;

@Data
public class CostCalc {
    // Номер абонента
    private Long msisdn;
    // Стоимость звонка в у.е.
    private Float cost;
    // Потраченные минуты
    private Integer minutesCost;
}
