import 'package:flutter/material.dart';
import 'package:flutter_task_manager/ui/widgets/screen_background.dart';
import 'package:flutter_task_manager/ui/widgets/user_profile_banner.dart';

class ProgressTask extends StatelessWidget {
  const ProgressTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: Column(
            children: [
              UserProfileBanner(),
              Expanded(
                child: ListView.separated(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Task ${index + 1}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Task description for task ${index + 1}'),
                          Text('Date: 1/1/24'),
                          Row(
                            children: [
                              Chip(
                                label: Text(
                                  'New',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.purple,
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  )),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 0,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
