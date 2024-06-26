import 'package:flutter/material.dart';
import 'package:flutter_task_manager/data/model/auth_utility.dart';
import 'package:flutter_task_manager/data/model/login_model.dart';
import 'package:flutter_task_manager/data/services/network_response.dart';
import 'package:flutter_task_manager/data/services/network_caller.dart';
import 'package:flutter_task_manager/data/url/urls.dart';
import 'package:flutter_task_manager/ui/screens/authentication_screens/email_verification_screen.dart';
import 'package:flutter_task_manager/ui/screens/authentication_screens/signup_screen.dart';
import 'package:flutter_task_manager/ui/screens/bottom_nav_screen/bottom_nav_base_screen.dart';
import 'package:flutter_task_manager/ui/widgets/screen_background.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // TextEditingController
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  // FormKey
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _signInProgress = false;

  Future<void> login() async {
    _signInProgress = true;
    if (mounted) {
      setState(() {});
    }
    Map<String, dynamic> requestBody = {
      "email": _emailTEController.text.trim(),
      "password": _passwordTEController.text,
    };

    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.signIn, requestBody);

    _signInProgress = false;
    if (mounted) {
      setState(() {});
    }

    if (!context.mounted) return;

    if (response.isSuccess) {
      LoginModel model =
          LoginModel.fromJson(response.body!); // Must Have a body
      await AuthUtility.saveUserInfo(model);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavBaseScreen()),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Failed!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _passwordTEController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter valid Password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: !_signInProgress,
                      replacement: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            login();
                          }
                        },
                        child: const Icon(Icons.arrow_forward_ios,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EmailVerificationScreen()),
                            (route) => false);
                      },
                      child: const Text('Forget Password?',
                          style: TextStyle(color: Colors.green)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const JoinWithUs()),
                              (route) => false);
                        },
                        child: const Text('Sign Up',
                            style: TextStyle(color: Colors.green)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
