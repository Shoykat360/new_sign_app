import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/auth_provider.dart';

class AuthController {
  // Login
  static Future<void> login(
      BuildContext context,
      GlobalKey<FormState> formKey,
      TextEditingController email,
      TextEditingController password,
      ) async {
    if (!formKey.currentState!.validate()) return;

    final provider = context.read<AuthProvider>();

    try {
      final success = await provider.login(email.text.trim(), password.text);
      if (success && context.mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  // Signup
  static Future<void> signup(
      BuildContext context,
      GlobalKey<FormState> formKey,
      TextEditingController name,
      TextEditingController email,
      TextEditingController password,
      TextEditingController confirmPassword,
      ) async {
    if (!formKey.currentState!.validate()) return;

    if (password.text != confirmPassword.text) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Passwords do not match')));
      return;
    }

    final provider = context.read<AuthProvider>();

    try {
      await provider.signup(name.text.trim(), email.text.trim(), password.text);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Signup successful! Verify your email')),
        );
        Navigator.pop(context); // Go back to login
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  // Reset Password
  static Future<void> resetPassword(
      BuildContext context,
      TextEditingController email,
      ) async {
    final provider = context.read<AuthProvider>();
    await provider.resetPassword(email.text);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset email sent')),
      );
    }
  }
}
