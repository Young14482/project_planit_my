import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDialog extends StatefulWidget {
  @override
  _CalendarDialogState createState() => _CalendarDialogState();
}

class _CalendarDialogState extends State<CalendarDialog> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('날짜 선택'),
      content: Container(
        width: double.maxFinite,
        child: TableCalendar(
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextFormatter: (date, locale) => '${date.year}년 ${date.month}월',
          ),
          firstDay: DateTime(DateTime.now().year - 10, 1, 1),
          lastDay: DateTime(DateTime.now().year + 10, 12, 31),
          focusedDay: selectedDate,
          selectedDayPredicate: (day) {
            return isSameDay(selectedDate, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              selectedDate = selectedDay;
            });
          },
          calendarBuilders: CalendarBuilders(
            selectedBuilder: (context, date, events) => Container(
              margin: const EdgeInsets.all(4.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                date.day.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('취소'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(selectedDate);
          },
          child: Text('완료'),
        ),
      ],
    );
  }
}
