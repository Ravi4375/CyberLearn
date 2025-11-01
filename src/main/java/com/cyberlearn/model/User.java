package com.cyberlearn.model;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String username;
    private String email;
    private String passwordHash;
    private LocalDateTime createdAt;
    private Integer totalScore = 0;
    private String role = "USER";

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getPasswordHash() { return passwordHash; }
    public void setPasswordHash(String passwordHash) { this.passwordHash = passwordHash; }
    
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
    
    public Integer getTotalScore() { 
        return totalScore != null ? totalScore : 0; 
    }
    public void setTotalScore(Integer totalScore) { 
        this.totalScore = totalScore != null ? totalScore : 0; 
    }
    
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
}