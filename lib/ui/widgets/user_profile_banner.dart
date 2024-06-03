import 'package:flutter/material.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
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
                'User Name',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Position',
                style: const TextStyle(
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
