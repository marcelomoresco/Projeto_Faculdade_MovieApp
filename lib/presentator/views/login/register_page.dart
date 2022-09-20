import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../domain/movies/service/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // controllers

  TextEditingController _emailController = TextEditingController();
  TextEditingController _confirmEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _confirmEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
    setState(() => _isLoading = true);

    try {
      await AuthService().signUp(
          _emailController.text.trim(), _passwordController.text.trim());

      setState(() => _isLoading = false);
    } catch (e) {
      print("Deu Merda");
    }
  }

  @override
  Widget build(BuildContext context) {
    //FABIO REGISTRAR PAGINA
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Já tem conta?"),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: widget.showLoginPage,
          child: const Text(
            "Login",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
