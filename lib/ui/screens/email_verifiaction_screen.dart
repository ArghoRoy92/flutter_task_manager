import 'package:flutter/material.dart';
import 'package:flutter_task_manager/ui/screens/pin_verificationt.dart';
import 'package:flutter_task_manager/ui/screens/widgets/screen_background.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(24),
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
              const Text(
                  'A 6 Digit Verification Code Will Be Send To Your Email Address.',
                  style: TextStyle(color: Colors.grey)),
              const SizedBox(
                height: 12,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PinVerification()));
                  },
                  child:
                      const Icon(Icons.arrow_forward_ios, color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Have Account?"),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Sign Up',
                        style: TextStyle(color: Colors.green)),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
