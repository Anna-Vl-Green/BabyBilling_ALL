package ru.bootcamp.babybilling.db;

import lombok.Data;

/**
 * Сущность деталей тарифа
 */
@Data
public class TariffDetails {
    private String type;
    private Float value;
}
