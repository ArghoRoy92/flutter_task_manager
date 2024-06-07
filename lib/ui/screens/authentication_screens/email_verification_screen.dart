import 'package:flutter/material.dart';
import 'package:flutter_task_manager/ui/screens/authentication_screens/pin_verification.dart';
import 'package:flutter_task_manager/ui/widgets/screen_background.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEditingController = TextEditingController();

  final GlobalKey _formKey = GlobalKey<FormState>();

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
                  'Your Email Address',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text('A 6 Digit Verification Code Will Be Send To Your Email Address.', style: TextStyle(color: Colors.grey)),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _emailTEditingController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter email';
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PinVerificationScreen()));
                    },
                    child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have Account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const PinVerificationScreen()), (route) => false);
                      },
                      child: const Text('Sign Up', style: TextStyle(color: Colors.green)),
                    ),
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
