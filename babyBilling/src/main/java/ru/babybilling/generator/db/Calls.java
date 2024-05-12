package ru.babybilling.generator.db;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;

/**
 * Сущность звонка
 */
@Entity
@Data
@Repository
@NoArgsConstructor
public class Calls {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;
    @Column(name = "subscriber_id")
    private Integer subscriberId;
    @Column(name = "contacted_subscriber_id")
    private Integer contactedSubscriberId;
    @Column(name = "start_time")
    private LocalDateTime startTime;
    @Column(name = "end_time")
    private LocalDateTime endTime;
    @Column(name = "type")
    private Integer callType;
}
