import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:planit/time/time_set-screen.dart';

import 'calender/dialog/calendar_dialog_screen.dart';

void main() async {
  // 한국어로 바꾸는 라이브러리 설정 >> 시작전에 바꾸고 가는 방식인듯
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko_KR', null); // 한국어 날짜 형식 초기화
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 한국어로 바꾸기 추가설정
      locale: Locale('ko', 'KR'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KR'), // 한국어
      ],
      home: CalendarDialogScreen(),
    );
  }
}
