import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../domain/movies/service/auth/auth_service.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    try {
      await AuthService().resetPassword(_emailController.text.trim());
    } on FirebaseAuthException catch (e) {
      print("Erro");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Digite seu email e enviaremos um link em seu E-mail!",
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              controller: _emailController,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  //errorText: _errorPasswordText,
                  prefixIcon: Icon(Icons.password),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade500),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade500),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "Senha",
                  hintStyle: const TextStyle(fontSize: 14)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: passwordReset,
            child: Text("Mudar Senha"),
          )
        ],
      ),
    );
  }
}
