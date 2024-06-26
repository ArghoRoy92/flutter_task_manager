import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task_manager/data/model/auth_utility.dart';
import 'package:flutter_task_manager/ui/screens/authentication_screens/login_screen.dart';
import 'package:flutter_task_manager/ui/screens/bottom_nav_screen/bottom_nav_base_screen.dart';
import 'package:flutter_task_manager/ui/widgets/screen_background.dart';
import 'package:flutter_task_manager/ui/utils/assets_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }

  void navigateToLogin() {
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      final bool isLoggedIn = await AuthUtility.ifUserInfoLoggedIn();
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>
                isLoggedIn ? const BottomNavBaseScreen() : const SignInScreen(),
          ),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: SvgPicture.asset(
            assetsUtils.logoSVG,
            width: 90,
          ),
        ),
      ),
    );
  }
}
