import 'package:darabeautysalon/main.dart';
import 'package:flutter/material.dart';

import '../utils/dara_colors.dart';
import '../utils/flutterCalender/clean_calendar.dart';

class DaraCalenderComponent extends StatefulWidget {
  const DaraCalenderComponent({super.key});

  @override
  _DaraCalenderComponentState createState() => _DaraCalenderComponentState();
}

class _DaraCalenderComponentState extends State<DaraCalenderComponent> {
  Map<DateTime, List> _events = <DateTime, List>{};
  List _selectedEvents = [];
  DateTime _selectedDay = DateTime.now();
  int? i;

  @override
  void initState() {
    super.initState();
    _selectedEvents = _events[_selectedDay] ?? [];
    init();
  }

  init() async {
    _events = {
      DateTime(_selectedDay.year, _selectedDay.month, 7): [],
    };
  }

  void _handleNewDate(date) {
    setState(() {
      _selectedDay = date;
      _selectedEvents = _events[_selectedDay] ?? [];
    });
    print(_selectedEvents);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16),
      child: Calendar(
        startOnMonday: false,
        weekDays: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
        events: _events,
        onRangeSelected: (range) =>
            print("Range is ${range.from}, ${range.to}"),
        onDateSelected: (date) => _handleNewDate(date),
        isExpandable: false,
        isExpanded: true,
        selectedColor: daraPrimaryColor,
        hideTodayIcon: true,
        hideArrows: true,
        eventColor: daraPrimaryColor,
        todayColor: daraPrimaryColor,
        dayOfWeekStyle: TextStyle(
            color: appStore.isDarkModeOn ? Colors.white : daraPrimaryColor,
            fontWeight: FontWeight.w800,
            fontSize: 11),
      ),
    );
  }
}
