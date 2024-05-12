package ru.bootcamp.brt.model;

import lombok.Data;

@Data
public class CostCalc {
    private Long msisdn;
    private Float cost;
    private Integer minutesCost;
}
