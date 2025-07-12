import 'package:flutter/material.dart';
import 'package:mvvm/view/services/splash_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashService splashService = SplashService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashService.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'SplashScreen',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}
