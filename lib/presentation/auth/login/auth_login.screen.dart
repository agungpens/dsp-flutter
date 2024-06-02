import 'package:delta_subur_prima/infrastructure/navigation/bindings/controllers/custom_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/auth_login.controller.dart';

class AuthLoginScreen extends GetView<AuthLoginController> {
  final c = Get.find<CustomController>();
  final thisController = Get.put(AuthLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Delta Subur Prima',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Card(
              color: const Color(0xFF82F87F), // Updated to the desired color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/logodsp.png', // path to your image
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      onChanged: (value) {
                        thisController.username.value =
                            value; // Update nilai username pada controller
                      },
                      decoration: InputDecoration(
                        labelText: 'Username',
                        filled: true, // Fill the background
                        fillColor: const Color.fromARGB(125, 0, 0, 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(() => TextField(
                          onChanged: (value) {
                            thisController.password.value =
                                value; // Update nilai password pada controller
                          },
                          obscureText: !c.isPasswordVisible.value,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            filled: true, // Fill the background
                            fillColor: const Color.fromARGB(125, 0, 0, 0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                c.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                c.togglePasswordVisibility();
                              },
                            ),
                          ),
                        )),
                    const SizedBox(height: 20),
                    FractionallySizedBox(
                      widthFactor:
                          0.5, // Button width is half of its parent width
                      child: ElevatedButton(
                        onPressed: () {
                          thisController.onLoginButtonPressed();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(
                              176, 0, 0, 0), // Background color
                          onPrimary: Colors.white, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Border radius
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Color(0xFF82F87F)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
