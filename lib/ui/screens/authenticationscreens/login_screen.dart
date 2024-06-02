import 'package:flutter/material.dart';
import 'package:flutter_task_manager/data/model/network_response.dart';
import 'package:flutter_task_manager/data/services/network_caller.dart';
import 'package:flutter_task_manager/data/url/urls.dart';
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

  Future<void> userSignIn() async {
    _signInProgress = true;
    if (mounted) {
      setState(() {});
    }

    final NetworkResponse response = await NetworkCaller().postRequest(
      Urls.signIn,
      <String, dynamic>{
        "email": _emailTEController.text.trim(),
        "password": _passwordTEController.text.trim(),
      },
      isLogin: true,
    );

    _signInProgress = false;
    if (mounted) {
      setState(() {});

      if (response.isSuccess) {
        _emailTEController.clear();
        _passwordTEController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Successful'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('SignIn Failed'),
          ),
        );
      }
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
                      replacement: const CircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            userSignIn();
                          }
                        },
                        child: const Icon(Icons.arrow_forward_ios,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {},
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
