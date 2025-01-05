import 'package:flutter/material.dart';

import '../utils.dart';

class CalendarBodyList extends StatelessWidget {
  const CalendarBodyList({
    super.key,
    required this.selectedEvents,
  });

  final ValueNotifier<List<Event>> selectedEvents;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder<List<Event>>(
        valueListenable: selectedEvents,
        builder: (context, value, _) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100, // 배경색: 밝은 회색
                  borderRadius: BorderRadius.circular(12.0), // 둥근 테두리
                ),
                child: Stack(
                  children: [
                    // 좌측 파란 포인트 색상
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        width: 5.0, // 포인트의 너비
                        decoration: const BoxDecoration(
                          color: Colors.blue, // 포인트 색상: 파란색
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0), // 둥근 모서리 (상단 왼쪽)
                            bottomLeft: Radius.circular(12.0), // 둥근 모서리 (하단 왼쪽)
                          ),
                        ),
                      ),
                    ),
                    // ListTile 본체
                    ListTile(
                      contentPadding: const EdgeInsets.only(
                        left: 16.0, // 좌측 간격
                        right: 8.0, // 우측 간격
                      ),
                      title: Text(
                        '${value[index]}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.flag,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          print('깃발 클릭: ${value[index]}');
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
