-- Fix difficulty levels to match enum values
UPDATE categories SET difficulty_level = 'INTERMEDIATE' WHERE difficulty_level = 'INTERMEDIATE';
UPDATE categories SET difficulty_level = 'BEGINNER' WHERE difficulty_level = 'BEGINNER';
UPDATE categories SET difficulty_level = 'ADVANCED' WHERE difficulty_level = 'ADVANCED';