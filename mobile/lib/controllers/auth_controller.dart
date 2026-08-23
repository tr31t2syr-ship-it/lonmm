import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoggedIn = false.obs;
  RxString userEmail = ''.obs;
  RxString userName = ''.obs;

  void login(String email, String name) {
    isLoggedIn.value = true;
    userEmail.value = email;
    userName.value = name;
  }

  void logout() {
    isLoggedIn.value = false;
    userEmail.value = '';
    userName.value = '';
  }
}
