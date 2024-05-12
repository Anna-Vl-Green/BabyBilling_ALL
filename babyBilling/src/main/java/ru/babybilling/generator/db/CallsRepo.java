package ru.babybilling.generator.db;

import org.aspectj.weaver.ast.Call;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@ComponentScan
@Repository
public interface CallsRepo extends JpaRepository<Calls, Integer> {
}
