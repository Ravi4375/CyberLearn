package com.cyberlearn.service;

import com.cyberlearn.model.User;
import com.cyberlearn.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private PasswordEncoder passwordEncoder;

    public User saveUser(User user) {
        return userRepository.save(user);
    }

    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public Optional<User> findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public boolean existsByUsername(String username) {
        return userRepository.findByUsername(username).isPresent();
    }

    public User registerUser(String username, String email, String password) {
        if (findByUsername(username).isPresent()) {

            throw new RuntimeException("Username already exists");
        }

        if (findByEmail(email).isPresent()) {
            throw new RuntimeException("Email already exists");
        }
        
        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPasswordHash(hashPassword(password));
        user.setCreatedAt(java.time.LocalDateTime.now());


        return saveUser(user);
    }


    public User loginUser(String username, String password) {

        Optional<User> userOpt = findByUsername(username);

        if (userOpt.isPresent() && checkPassword(password, userOpt.get().getPasswordHash())) {
            return userOpt.get();
        }

        return null;
    }


    private String hashPassword(String password) {

        return passwordEncoder.encode(password);
    }

    //here it will match the hash
    private boolean checkPassword(String password, String hashedPassword) {

        return passwordEncoder.matches(password, hashedPassword);
    }
}