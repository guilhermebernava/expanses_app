import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: const Text("Email"),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2.5,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2.5,
                    color: Colors.green,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2.5,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2.5,
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text("Password"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
