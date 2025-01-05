import 'package:flutter/material.dart';
import 'repeat_task_dialog.dart';

class RepeatTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('반복 다이얼로그')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return RepeatTaskDialog();
              },
            );
          },
          child: Text('연다 다이얼로그를'),
        ),
      ),
    );
  }
}
