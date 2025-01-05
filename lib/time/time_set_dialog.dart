import 'package:flutter/material.dart';

class TimeSetDialog extends StatefulWidget {
  @override
  _TimeSetDialogState createState() => _TimeSetDialogState();
}

class _TimeSetDialogState extends State<TimeSetDialog> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue.shade200, // 다이얼로그 기본 색상
              onSurface: Colors.black, // 다이얼로그 글씨 색상
              secondary: Colors.blue.shade100, // AM/PM 버튼 색상
            ),
            primaryColor: Colors.blue.shade100,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, // 취소 확인 버튼 색깔
              ),
            ),
          ),
          child: child ?? Container(),
        );
      },
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('시간 설정'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('시간 입력'),
          SizedBox(height: 20),
          Text(
            '${_selectedTime.format(context)}',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _selectTime(context),
            child: Text('시간 선택'),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text('취소'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('완료'),
          onPressed: () {
            Navigator.of(context).pop(_selectedTime);
          },
        ),
      ],
    );
  }
}
