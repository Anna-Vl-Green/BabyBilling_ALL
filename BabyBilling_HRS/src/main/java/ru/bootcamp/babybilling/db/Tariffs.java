package ru.bootcamp.babybilling.db;

import io.hypersistence.utils.hibernate.type.json.JsonType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Type;

import java.util.List;

/**
 * Сущность тарифа
 */
@Entity
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Tariffs {
    @Id
    @Column(name = "id")
    private Integer id;
    @Column(name = "name")
    private String name;
    @Column(columnDefinition = "jsonb")
    @Type(JsonType.class)
    private List<TariffDetails> details;
}