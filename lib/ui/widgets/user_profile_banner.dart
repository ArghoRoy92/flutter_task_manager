import 'package:flutter/material.dart';
import 'package:flutter_task_manager/data/model/auth_utility.dart';
import 'package:flutter_task_manager/ui/screens/authentication_screens/login_screen.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.green,
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 25,
          ),
          const SizedBox(
              width: 10), // Adds space between the CircleAvatar and the text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${AuthUtility.userInfo.data?.firstName ?? ' '} ${AuthUtility.userInfo.data?.lastName ?? ' '}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  AuthUtility.userInfo.data?.email ?? ' ',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () async {
              await AuthUtility.clearUserInfo();
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
                  (route) {
                return false;
              });
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
