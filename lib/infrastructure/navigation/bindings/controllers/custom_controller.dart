import 'package:get/get.dart';

class CustomController extends GetxController {
  var isDark = false.obs;
  var isPasswordVisible = false.obs;
  var selectedOption = ''.obs; // Menyimpan nilai pilihan dropdown

  void changeTheme() => isDark.value = !isDark.value;

  void togglePasswordVisibility() =>
      isPasswordVisible.value = !isPasswordVisible.value;

  void updateSelectedOption(String newValue) {
    selectedOption.value = newValue; // Memperbarui nilai pilihan dropdown
  }
}
