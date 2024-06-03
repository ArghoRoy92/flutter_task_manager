import 'package:flutter/material.dart';
import 'package:flutter_task_manager/data/model/network_response.dart';
import 'package:flutter_task_manager/data/services/network_caller.dart';
import 'package:flutter_task_manager/data/url/urls.dart';
import 'package:flutter_task_manager/ui/widgets/screen_background.dart';

class JoinWithUs extends StatefulWidget {
  const JoinWithUs({super.key});

  @override
  State<JoinWithUs> createState() => _JoinWithUsState();
}

class _JoinWithUsState extends State<JoinWithUs> {
  //TextEditingController
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstTENameController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileNoTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  //FormKey
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _signUpProgress = false;

  Future<void> userSignUp() async {
    _signUpProgress = true;
    if (mounted) {
      setState(() {});
    }

    final NetworkResponse response = await NetworkCaller().postRequest(
      Urls.signUp,
      <String, dynamic>{
        "email": _emailTEController.text.trim(),
        "firstName": _firstTENameController.text.trim(),
        "lastName": _lastNameTEController.text.trim(),
        "mobile": _mobileNoTEController.text.trim(),
        "password": _passwordTEController.text.trim(),
      },
    );

    _signUpProgress = false;
    if (mounted) {
      setState(() {});

      if (response.isSuccess) {
        _emailTEController.clear();
        _firstTENameController.clear();
        _lastNameTEController.clear();
        _mobileNoTEController.clear();
        _passwordTEController.clear();
      }

      if (response.isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Successful'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sign up failed'),
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
                    'Join With Us',
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
                    controller: _firstTENameController,
                    decoration: const InputDecoration(
                      hintText: 'First Name',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter First Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _lastNameTEController,
                    decoration: const InputDecoration(
                      hintText: 'Last Name',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter Last Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _mobileNoTEController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: 'Mobile',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter valid Mobile No';
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
                      visible: !_signUpProgress,
                      replacement: const CircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            userSignUp();
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
                      const Text("Have Account?"),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Sign In',
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
