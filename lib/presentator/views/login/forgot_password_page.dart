import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../domain/movies/service/auth/auth_service.dart';
import 'package:lottie/lottie.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

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
      extendBodyBehindAppBar: true,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 530,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /*Lottie.asset(
                      'assets/password.json',
                      width: 500,
                      height: 250,
                    )*/
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 300,
            child: Container(
              height: 280,
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.white, width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.38),
                      spreadRadius: 5,
                      blurRadius: 15,
                    )
                  ]),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Digite seu email e lhe enviaremos um link!",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Campo Obrigatório";
                                } else if (!value.contains('@')) {
                                  return "E-mail Incorreto";
                                }
                                return null;
                              },
                              controller: _emailController,
                              obscureText: false,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  //errorText: _errorEmailText,
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade500),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade500),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  contentPadding: const EdgeInsets.all(10),
                                  hintText: "E-mail",
                                  hintStyle: const TextStyle(fontSize: 14)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.7),
                                spreadRadius: 5,
                                blurRadius: 15,
                              )
                            ]),
                        child: _isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white),
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Após registrar será enviado um\n E-mail para confirmação!')),
                                    );
                                  }
                                },
                                child: GestureDetector(
                                  child: const Text("Mudar Senha",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
