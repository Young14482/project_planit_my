import 'package:flutter/material.dart';
import 'calendar_dialog.dart';

class CalendarDialogScreen extends StatefulWidget {
  @override
  _CalendarDialogScreenState createState() => _CalendarDialogScreenState();
}

class _CalendarDialogScreenState extends State<CalendarDialogScreen> {
  DateTime? _selectedDate;

  void _showCalendarDialog() async {
    final DateTime pickedDate = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CalendarDialog();
      },
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('달력 다이얼로그'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: _showCalendarDialog,
              child: Text('날짜 선택'),
            ),
            SizedBox(height: 20),
            if (_selectedDate != null)
              Text('선택한 날짜: ${_selectedDate!.toLocal()}'),
          ],
        ),
      ),
    );
  }
}
