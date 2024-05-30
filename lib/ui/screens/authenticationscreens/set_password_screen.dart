import 'package:flutter/material.dart';
import 'package:flutter_task_manager/ui/screens/authenticationscreens/signup_screen.dart';
import 'package:flutter_task_manager/ui/widgets/screen_background.dart';

class SetPassword extends StatelessWidget {
  const SetPassword({super.key});

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
                'Set Your Password',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                  'Minimum Length Password 8 Charecter With Letter And Number Combination.',
                  style: TextStyle(color: Colors.grey)),
              const SizedBox(
                height: 12,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
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
                            builder: (context) => const JoinWithUs()));
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
