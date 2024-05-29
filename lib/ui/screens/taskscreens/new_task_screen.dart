import 'package:flutter/material.dart';
import 'package:flutter_task_manager/ui/screens/taskscreens/add_new_task.dart';
import 'package:flutter_task_manager/ui/widgets/screen_background.dart';
import 'package:flutter_task_manager/ui/widgets/summary_card.dart';
import 'package:flutter_task_manager/ui/widgets/user_profile_banner.dart';

class NewTask extends StatelessWidget {
  const NewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: Column(
            children: [
              UserProfileBanner(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SummaryCard(
                        number: 123,
                        title: 'New',
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: SummaryCard(
                        number: 123,
                        title: 'Inprogress',
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: SummaryCard(
                        number: 123,
                        title: 'Cancel',
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: SummaryCard(
                        number: 123,
                        title: 'Completed',
                      ),
                    ),
                  ],
                ),
              ),
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
                                backgroundColor: Colors.blue,
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
                          ),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNewTask()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        tooltip: 'Add',
      ),
    );
  }
}
