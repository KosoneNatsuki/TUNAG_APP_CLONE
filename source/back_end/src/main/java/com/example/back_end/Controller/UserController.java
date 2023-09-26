package com.example.back_end.Controller;

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

import java.util.Map;

@RequiredArgsConstructor
@Controller

public class UserController {

   private final UserRepository repository;
   // private static final Logger logger =
   // LoggerFactory.getLogger(UserController.class);

   // Read
   @GetMapping("/")
   public String showAllUser(@ModelAttribute User user, Model model) {
      model.addAttribute("User", repository.findAll());
      return "test";
   }

   @PostMapping("/add")
   public ResponseEntity<String> addUser(@RequestBody Map<String, String> requestData) {
      String name = requestData.get("name");
      String email = requestData.get("email");
      String password = requestData.get("password");

      // emailとpasswordを使ってユーザーをデータベースに保存するなどの処理を実行
      User user = new User();
      user.setName(name);
      user.setEmail(email);
      user.setPassword(password);

      repository.save(user);
      return ResponseEntity.ok("ユーザーが登録されました");
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
