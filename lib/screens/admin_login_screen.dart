import 'package:admin_panel/constants/constants.dart';
import 'package:admin_panel/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Admin Login"),
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 400,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Username"),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: 200,
                    child: TextField(
                      controller: usernameController,
                      // decoration: const InputDecoration(hintText: "Username"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 400,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Password"),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: 200,
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      // decoration: const InputDecoration(hintText: "Password"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                if (usernameController.text == adminUsername &&
                    passwordController.text == adminPassword) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                      (route) => false);
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            width: 300,
                            height: 300,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(
                                  Icons.error,
                                  size: 80,
                                  color: Colors.red,
                                ),
                                Text(
                                  "Invalid username or password",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber),
                alignment: Alignment.center,
                child: const Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
