import 'package:flutter/material.dart';
import 'time_set_dialog.dart';

class TimeSetrScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('시간 설정'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return TimeSetDialog();
              },
            );
          },
        ),
      ),
    );
  }
}
