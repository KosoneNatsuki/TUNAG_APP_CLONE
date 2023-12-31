package com.example.back_end.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import com.example.back_end.model.User;
import com.example.back_end.repository.UserRepository;
import lombok.RequiredArgsConstructor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Controller

public class UserController {
   // デバッグ
   private static final Logger logger = LoggerFactory.getLogger(UserController.class);

   private final UserRepository repository;

   // ---------------------------- ユーザー新規登録 ---------------------------- //
   @PostMapping("/add")
   public ResponseEntity<Map<String, Integer>> addUser(@RequestBody Map<String, String> requestData) {
      // flutterのテキストエリアに入力したデータを変数に格納
      String name = requestData.get("name");
      String email = requestData.get("email");
      String password = requestData.get("password");
      email += "@gmail.com";

      // 格納したデータをuser変数にセット
      User user = new User();
      user.setName(name);
      user.setEmail(email);
      user.setPassword(password);

      try {
         if (name.isEmpty() || email.isEmpty() || password.isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
         } else {
            // データベースに保存
            repository.save(user);
            Map<String, Integer> response = new HashMap<>();
            response.put("userId", user.getId()); // ユーザーIDを追加
            return ResponseEntity.ok(response);
         }

      } catch (DataIntegrityViolationException e) {
         // 一意性制約違反などのエラーが発生した場合の処理
         return ResponseEntity.status(HttpStatus.CONFLICT).body(null);
      } catch (Exception e) {
         // その他のエラーが発生した場合の処理
         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
      }
   }

   // ------------------------------- ログイン ------------------------------- //
   @PostMapping("/login")
   public ResponseEntity<Map<String, Integer>> login(@RequestBody Map<String, String> loginRequest) {
      String email = loginRequest.get("email");
      String password = loginRequest.get("password");
      email += "@gmail.com"; // DBで検索するので文字列を追記

      // 同じメールアドレスの場合もある為、リストとしてemailを追加
      List<User> users = repository.findByEmail(email);

      for (User user : users) {
         if (password.equals(user.getPassword())) {
            // パスワードが一致するユーザーが見つかった場合、ログイン成功
            Map<String, Integer> response = new HashMap<>();
            response.put("userId", user.getId());
            return ResponseEntity.ok(response);
         }
      }

      // パスワードが一致するユーザーが見つからない場合、ログイン失敗
      return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
   }

   // 読み込む
   @GetMapping("/")
   public String showAllUser(@ModelAttribute User user, Model model) {
      model.addAttribute("User", repository.findAll());
      return "test";
   }

   // Update
   @PostMapping("/edit")
   public String editUser(@ModelAttribute User user) {
      repository.save(user);
      return "login";
   }

   // Delete
   @GetMapping("/delete/{id}")
   public String deleteUser(@PathVariable Integer id) {
      repository.deleteById(id);
      return "login";
   }
}
