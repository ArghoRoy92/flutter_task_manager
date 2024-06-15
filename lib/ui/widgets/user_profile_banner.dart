import 'package:flutter/material.dart';
import 'package:flutter_task_manager/data/model/auth_utility.dart';

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
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 25,
          ),
          SizedBox(
              width: 10), // Adds space between the CircleAvatar and the text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (AuthUtility.userInfo.data?.firstName ?? ' ') +
                    ' ' +
                    (AuthUtility.userInfo.data?.lastName ?? ' '),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                AuthUtility.userInfo.data?.email ?? ' ',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
