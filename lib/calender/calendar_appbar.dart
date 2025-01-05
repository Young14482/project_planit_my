import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarAppBar extends StatelessWidget implements PreferredSizeWidget {
  final DateTime focusedDay;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;

  const CalendarAppBar({
    super.key,
    required this.focusedDay,
    required this.onPreviousMonth,
    required this.onNextMonth,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue.shade100, // 앱바 배경색
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            // 달력 조절 버튼
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  // 전 달로 버튼
                  Container(
                    width: 48.0,
                    child: IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: onPreviousMonth,
                    ),
                  ),
                  // 현재 달을 알려주는 부분
                  Expanded(
                    child: Center(
                      child: Text(
                        DateFormat.yMMMM().format(focusedDay),
                        style: const TextStyle(fontSize: 24.0),
                      ),
                    ),
                  ),
                  // 다음 달로 버튼
                  Container(
                    width: 48.0,
                    child: IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: onNextMonth,
                    ),
                  ),
                ],
              ),
            ),
            // 여백용
            Expanded(child: Container(), flex: 2),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
