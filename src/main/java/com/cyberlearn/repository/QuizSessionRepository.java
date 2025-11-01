package com.cyberlearn.repository;

import com.cyberlearn.model.QuizSession;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface QuizSessionRepository extends JpaRepository<QuizSession, Long> {
    List<QuizSession> findByUserIdOrderByAttemptTimeDesc(Long userId);
}