import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/utilis/utilis.dart';
import 'package:zoom_clone/widgets/custom_button.dart';
import 'package:flutter_hud/flutter_hud.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  bool isLoading = false;

  Future<void> _handleSignIn() async {
    try {
      setState(() {
        isLoading = true;
      });

      bool res = await _authMethods.signInWithGoogle(context);
      print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'+res.toString());
      if (res) {
        Navigator.pushNamed(context, '/home');
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
 @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: WidgetHUD(
        showHUD: isLoading,
        builder: (context, child) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Start or join a meeting',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Image.asset('assets/images/onboarding.jpg'),
                  CustomButton(
                    text: 'Sign With Google',
                    onPressed: _handleSignIn,
                    leading:
                        'https://static.vecteezy.com/system/resources/previews/022/484/503/original/google-lens-icon-logo-symbol-free-png.png',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
