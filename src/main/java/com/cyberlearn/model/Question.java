package com.cyberlearn.model;

import javax.persistence.*;

@Entity
@Table(name = "questions")
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;
    
    private String questionText;
    
    @Enumerated(EnumType.STRING)
    private QuestionType questionType;
    
    @Enumerated(EnumType.STRING)
    private DifficultyLevel difficulty;
    
    private Integer points = 10;
    private String codeSnippet;
    
    public enum QuestionType {
        MULTIPLE_CHOICE, TRUE_FALSE, CODE_REVIEW
    }
    
    public enum DifficultyLevel {
        BEGINNER, INTERMEDIATE, ADVANCED
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    
    public Category getCategory() { return category; }
    public void setCategory(Category category) { this.category = category; }
    
    public String getQuestionText() { return questionText; }
    public void setQuestionText(String questionText) { this.questionText = questionText; }
    
    public QuestionType getQuestionType() { return questionType; }
    public void setQuestionType(QuestionType questionType) { this.questionType = questionType; }
    
    public DifficultyLevel getDifficulty() { return difficulty; }
    public void setDifficulty(DifficultyLevel difficulty) { this.difficulty = difficulty; }
    
    public Integer getPoints() { return points; }
    public void setPoints(Integer points) { this.points = points; }
    
    public String getCodeSnippet() { return codeSnippet; }
    public void setCodeSnippet(String codeSnippet) { this.codeSnippet = codeSnippet; }
}