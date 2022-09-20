import 'dart:ui';
import 'package:flutter/material.dart';
import '../../utils/app_routes.dart';
import '../../components/custom_outlined.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              Positioned(
                top: screenHeight * 0.1,
                left: -88,
                child: Container(
                  height: 166,
                  width: 166,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 200,
                      sigmaY: 200,
                    ),
                    child: Container(
                      height: 166,
                      width: 166,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.3,
                right: -100,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 200,
                      sigmaY: 200,
                    ),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.07,
                    ),
                    CustomOutline(
                      strokeWidth: 4,
                      radius: screenWidth * 0.8,
                      padding: const EdgeInsets.all(4),
                      width: screenWidth * 0.8,
                      height: screenWidth * 0.8,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(0),
                            Colors.black.withOpacity(0.1),
                            Colors.black
                          ],
                          stops: const [
                            0.2,
                            0.4,
                            0.6,
                            1
                          ]),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomLeft,
                            image: AssetImage('assets/img-onboarding.png'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.09,
                    ),
                    Text(
                      'Veja os Filmes\nEm Cartaz Mais Populares',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.85),
                        fontSize: screenHeight <= 667 ? 18 : 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Text(
                      'Conheça os filmes mais \npopulares do momento e veja as avaliações',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.75),
                        fontSize: screenHeight <= 667 ? 12 : 16,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),

                    //~Botão
                    Container(
                      height: 35,
                      width: 140,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.LOGIN_PAGE);
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
