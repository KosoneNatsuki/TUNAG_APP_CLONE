package com.example.back_end.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import java.util.Map;

@RequiredArgsConstructor
@Controller

public class UserController {
   // デバッグ
   private static final Logger logger = LoggerFactory.getLogger(UserController.class);

   private final UserRepository repository;

   // ---------------------------- ユーザー新規登録 ---------------------------- //
   @PostMapping("/add")
   public ResponseEntity<String> addUser(@RequestBody Map<String, String> requestData) {
      // flutterのテキストエリアに入力したデータを変数に格納
      String name = requestData.get("name");
      String email = requestData.get("email");
      String password = requestData.get("password");

      // 格納したデータをuser変数にセット
      User user = new User();
      user.setName(name);
      user.setEmail(email);
      user.setPassword(password);

      // セットしたデータをDBに保存
      repository.save(user);
      return ResponseEntity.ok("ユーザーが登録されました");
   }

   // ------------------------------- ログイン ------------------------------- //
   @PostMapping("/login")
   public ResponseEntity<Map<String, Integer>> login(@RequestBody Map<String, String> loginRequest) {
      String email = loginRequest.get("email");
      String password = loginRequest.get("password");

      // emailとpasswordを使ってユーザーをデータベースから検索
      User user = repository.findByEmail(email);

      if (user == null || !user.getPassword().equals(password)) {
         // ユーザーが存在しないか、パスワードが一致しない場合の処理
         return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null); // エラーの場合はnullを返す
      }

      // ログイン成功時の処理
      // ユーザーIDを含めたレスポンスを返す
      Map<String, Integer> response = new HashMap<>();
      response.put("userId", user.getId()); // ユーザーIDを追加

      return ResponseEntity.ok(response);
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
