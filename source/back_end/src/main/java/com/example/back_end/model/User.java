package com.example.back_end.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;

@Getter // フィールドのgetメソッド(id, content)を自動生成
@Setter // フィールドのsetメソッド(id, content)を自動生成
@Entity // データの入れ物であるEntityクラスであることを指定

public class User {
    @Id // Entityの主キーを設定する
    @GeneratedValue // Entityの値を自動採番する

    private Integer id;
    private String name;
    private String email;
    private String password;
}
