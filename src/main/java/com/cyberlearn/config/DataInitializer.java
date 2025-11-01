package com.cyberlearn.config;

import com.cyberlearn.model.*;
import com.cyberlearn.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

// @Component - Disabled to use Flyway migrations instead
public class DataInitializer implements CommandLineRunner {

    @Autowired
    private CategoryRepository categoryRepository;
    
    @Autowired
    private QuestionRepository questionRepository;
    
    @Autowired
    private AnswerOptionRepository answerOptionRepository;

    @Override
    public void run(String... args) throws Exception {
        if (categoryRepository.count() == 0) {
            initializeData();
        }
    }

    private void initializeData() {
        // Create categories
        Category accessControl = new Category();
        accessControl.setName("Broken Access Control");
        accessControl.setDescription("Restrictions on what authenticated users are allowed to do are not properly enforced.");
        accessControl.setDifficultyLevel(Category.DifficultyLevel.INTERMEDIATE);
        accessControl = categoryRepository.save(accessControl);

        Category cryptoFailures = new Category();
        cryptoFailures.setName("Cryptographic Failures");
        cryptoFailures.setDescription("Failures related to cryptography, often leading to exposure of sensitive data.");
        cryptoFailures.setDifficultyLevel(Category.DifficultyLevel.INTERMEDIATE);
        cryptoFailures = categoryRepository.save(cryptoFailures);

        Category injection = new Category();
        injection.setName("Injection");
        injection.setDescription("Unsanitized data is sent to an interpreter as part of a command or query.");
        injection.setDifficultyLevel(Category.DifficultyLevel.INTERMEDIATE);
        injection = categoryRepository.save(injection);

        // Create questions
        Question q1 = new Question();
        q1.setCategory(accessControl);
        q1.setQuestionText("Which of the following best describes Broken Access Control?");
        q1.setQuestionType(Question.QuestionType.MULTIPLE_CHOICE);
        q1.setDifficulty(Question.DifficultyLevel.BEGINNER);
        q1.setPoints(10);
        q1 = questionRepository.save(q1);

        Question q2 = new Question();
        q2.setCategory(accessControl);
        q2.setQuestionText("True or False: Access control checks should be performed on the server side.");
        q2.setQuestionType(Question.QuestionType.TRUE_FALSE);
        q2.setDifficulty(Question.DifficultyLevel.BEGINNER);
        q2.setPoints(10);
        q2 = questionRepository.save(q2);

        Question q3 = new Question();
        q3.setCategory(cryptoFailures);
        q3.setQuestionText("Which of the following is an example of a cryptographic failure?");
        q3.setQuestionType(Question.QuestionType.MULTIPLE_CHOICE);
        q3.setDifficulty(Question.DifficultyLevel.BEGINNER);
        q3.setPoints(10);
        q3 = questionRepository.save(q3);

        // Create answer options
        AnswerOption a1_1 = new AnswerOption();
        a1_1.setQuestion(q1);
        a1_1.setOptionText("Restrictions on user actions are not properly enforced.");
        a1_1.setIsCorrect(true);
        a1_1.setExplanation("Broken Access Control means users can perform actions beyond their permissions.");
        answerOptionRepository.save(a1_1);

        AnswerOption a1_2 = new AnswerOption();
        a1_2.setQuestion(q1);
        a1_2.setOptionText("Passwords are stored in plain text.");
        a1_2.setIsCorrect(false);
        a1_2.setExplanation("This is a storage issue, not access control.");
        answerOptionRepository.save(a1_2);

        AnswerOption a2_1 = new AnswerOption();
        a2_1.setQuestion(q2);
        a2_1.setOptionText("True");
        a2_1.setIsCorrect(true);
        a2_1.setExplanation("Server-side checks are required as client-side checks can be bypassed.");
        answerOptionRepository.save(a2_1);

        AnswerOption a2_2 = new AnswerOption();
        a2_2.setQuestion(q2);
        a2_2.setOptionText("False");
        a2_2.setIsCorrect(false);
        a2_2.setExplanation("Client-side checks are insecure and can be manipulated.");
        answerOptionRepository.save(a2_2);

        AnswerOption a3_1 = new AnswerOption();
        a3_1.setQuestion(q3);
        a3_1.setOptionText("Storing passwords in plain text.");
        a3_1.setIsCorrect(true);
        a3_1.setExplanation("Plain text storage is a cryptographic failure.");
        answerOptionRepository.save(a3_1);

        AnswerOption a3_2 = new AnswerOption();
        a3_2.setQuestion(q3);
        a3_2.setOptionText("Using strong encryption algorithms.");
        a3_2.setIsCorrect(false);
        a3_2.setExplanation("This is best practice, not a failure.");
        answerOptionRepository.save(a3_2);
    }
}