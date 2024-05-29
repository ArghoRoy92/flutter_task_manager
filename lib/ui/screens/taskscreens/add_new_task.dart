import 'package:flutter/material.dart';
import 'package:flutter_task_manager/ui/widgets/screen_background.dart';
import 'package:flutter_task_manager/ui/widgets/user_profile_banner.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserProfileBanner(),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add New Task',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 15),
                    const TextField(
                      decoration: InputDecoration(
                          hintText: 'Subject',
                          contentPadding: EdgeInsets.all(10)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const TextField(
                      maxLines: 6,
                      decoration: InputDecoration(
                          hintText: 'Description',
                          contentPadding: EdgeInsets.all(10)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Icon(Icons.arrow_forward_ios,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
