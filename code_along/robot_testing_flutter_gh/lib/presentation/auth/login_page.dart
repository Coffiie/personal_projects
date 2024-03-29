import 'package:flutter/material.dart';
import 'package:robot_testing_flutter_gh/presentation/core/widget_keys.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.loginScreen,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              key: WidgetKeys.loginUsernameController,
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              key: WidgetKeys.loginPasswordController,
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              key: WidgetKeys.loginButton,
              onPressed: () {
                final username = usernameController.text;
                final password = passwordController.text;
                if (username == '1234' && password == '1234') {
                  Navigator.of(context).pushNamed('/home-page');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      key: WidgetKeys.loginErrorSnackbar,
                      content: Text('Wrong credentials'),
                    ),
                  );
                }
              },
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
