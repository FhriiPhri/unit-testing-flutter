import 'package:flutter/material.dart';
import '../utils/validator.dart';

class LoginForm extends StatefulWidget {
  final void Function(String email, String password) onLogin;

  const LoginForm({super.key, required this.onLogin});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            key: const Key('emailField'),
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) =>
                Validator.isValidEmail(value ?? '') ? null : 'Email tidak valid',
          ),
          TextFormField(
            key: const Key('passwordField'),
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Password'),
            validator: (value) =>
                (value != null && value.length >= 6) ? null : 'Minimal 6 karakter',
          ),
          ElevatedButton(
            key: const Key('loginButton'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onLogin(
                  _emailController.text,
                  _passwordController.text,
                );
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}