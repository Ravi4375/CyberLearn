-- Fix question types from MCQ to MULTIPLE_CHOICE
UPDATE questions SET question_type = 'MULTIPLE_CHOICE' WHERE question_type = 'MCQ';
