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

  Future<void> userSignUp() async {
    final NetworkResponse response = await NetworkCaller().postRequest(
      Urls.baseUrl,
      <String, dynamic>{
        "email": _emailTEController.text.trim(),
        "firstName": _firstTENameController.text.trim(),
        "lastName": _lastNameTEController.text.trim(),
        "mobile": _mobileNoTEController.text.trim(),
        "password": _passwordTEController.text.trim(),
      },
    );

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
                    decoration: InputDecoration(
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
                    decoration: InputDecoration(
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
                    decoration: InputDecoration(
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
                    decoration: InputDecoration(
                      hintText: 'Mobile',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true || value!.length < 10) {
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
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true || value!.length < 5) {
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
