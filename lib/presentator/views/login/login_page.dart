import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../../domain/movies/entities/google_sign_in.dart';
import '../../../domain/movies/service/auth/auth_service.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({super.key, required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // controllers

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> signIn() async {
    setState(() => _isLoading = true);

    await AuthService()
        .login(_emailController.text.trim(), _passwordController.text.trim());
    setState(() => _isLoading = false);
  }

  bool isVisible = false;

  toggleIsVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Lottie.asset('assets/lottie_movie.json'),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 250,
            child: Container(
              height: 450,
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
                              "Login",
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
                        TextField(
                          controller: _emailController,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              //errorText: _errorEmailText,
                              prefixIcon: const Icon(Icons.email),
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
                        TextField(
                          controller: _passwordController,
                          obscureText: isVisible ? false : true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            //errorText: _errorPasswordText,
                            prefixIcon: const Icon(Icons.password),
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
                            hintText: "Senha",
                            hintStyle: const TextStyle(fontSize: 14),
                            suffixIcon: GestureDetector(
                              onTap: toggleIsVisible,
                              child: const Icon(Icons.visibility_off_outlined),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const ForgotPasswordPage();
                            }));
                          },
                          child: Text("Esqueceu a senha?",
                              style: TextStyle(
                                  color: Colors.blue[500],
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
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
                            child:
                                CircularProgressIndicator(color: Colors.white),
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                            onPressed: () {
                              signIn();
                            },
                            child: GestureDetector(
                              child: const Text("Login",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Ainda não tem conta?"),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: widget.showRegisterPage,
                        child: const Text(
                          "Registrar Agora",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 250,
                    child: ElevatedButton.icon(
                        icon: const FaIcon(FontAwesomeIcons.google,
                            color: Colors.red),
                        onPressed: () {
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.googleLogin();
                        },
                        label: Text("Registre-se com o Gmail",
                            style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            minimumSize: Size(double.infinity, 50))),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
