package ru.bootcamp.babybilling.model;

import lombok.Data;
import ru.bootcamp.babybilling.db.TariffDetails;

import java.util.List;

/**
 * Сущность детализированного звонка
 */
@Data
public class Calls {

    private Integer callType;
    private Long startTime;
    private Long endTime;
    private Integer tariffId;
    private Long callTime;
    private List<TariffDetails> tariffDetailsList;
}
