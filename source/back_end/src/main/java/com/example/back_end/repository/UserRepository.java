package com.example.back_end.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.back_end.model.User;

@Repository // Repositoryクラスであることを示す
// User: エンティティクラス指定、Integer: idの型を指定
public interface UserRepository extends JpaRepository<User, Integer> {

    User findByEmail(String email);
    User findByPassword(String password);
}