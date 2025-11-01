package com.cyberlearn.repository;

import com.cyberlearn.model.CodeSnippet;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface CodeSnippetRepository extends JpaRepository<CodeSnippet, Long> {
    List<CodeSnippet> findByQuestionId(Long questionId);
}