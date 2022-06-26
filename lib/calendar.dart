import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class Bar extends StatelessWidget {
  const Bar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          color: Colors.black12,
        ),
      ),
    );
  }
}

class EventBox extends StatelessWidget {
  const EventBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.only(left: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.lightBlue.shade900,
        ),
        width: 500,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: const Radius.circular(10.0),
                  bottomRight: const Radius.circular(10.0)),
              color: Colors.orange.shade50,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Text(
                              "Meeting",
                              style: TextStyle(
                                  color: Colors.lightBlue.shade900,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "09:00 AM - 09:30 AM GMT +7",
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text.rich(
                                TextSpan(
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                  children: [
                                    WidgetSpan(
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "https://www.w3schools.com/howto/img_avatar.png"),
                                      ),
                                    ),
                                    TextSpan(
                                        text: 'View Client Profile',
                                        style: TextStyle(
                                            color: Colors.blue.shade900,
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 14))
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  ]),
            )),
      ),
    );
  }
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  static const listMonth = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  String checkCurrentMonth(focusedDay) {
    focusedDay =
        DateFormat('yyyy-MM-dd – kk:mm').format(selectedDay).substring(5, 7);
    var currentMonth = "";
    for (var i = 0; i < listMonth.length; i++) {
      if (int.parse(focusedDay) - 1 == i) {
        currentMonth = listMonth[i];
      }
    }
    currentMonth += " " +
        DateFormat('yyyy-MM-dd – kk:mm').format(selectedDay).substring(0, 4);
    return currentMonth;
  }

  String checkCurrentDay(focusedDay) {
    focusedDay =
        DateFormat('yyyy-MM-dd – kk:mm').format(selectedDay).substring(5, 7);
    var currentDay = "Today, " +
        DateFormat('yyyy-MM-dd – kk:mm').format(selectedDay).substring(8, 10) +
        " ";
    for (var i = 0; i < listMonth.length; i++) {
      if (int.parse(focusedDay) - 1 == i) {
        currentDay += listMonth[i].substring(0, 3);
      }
    }

    return currentDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    checkCurrentMonth(focusedDay),
                    style: TextStyle(
                        color: Colors.lightBlue.shade900,
                        fontSize: 25,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              TableCalendar(
                focusedDay: selectedDay,
                firstDay: DateTime(1990),
                lastDay: DateTime(2050),

                calendarFormat: format,
                onFormatChanged: (CalendarFormat _format) {
                  setState(() {
                    format = _format;
                  });
                },
                startingDayOfWeek: StartingDayOfWeek.sunday,
                daysOfWeekVisible: true,

                //Day Changed
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    selectedDay = selectDay;
                    focusedDay = focusDay;
                  });
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },

                //To style the Calendar
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: Colors.lightBlue.shade900,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  selectedTextStyle: TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  defaultDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  weekendDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: true,
                  titleCentered: true,
                  formatButtonShowsNext: false,
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  formatButtonTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Bar(),
              Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Text(
                        "Upcoming Events",
                        style: TextStyle(
                            color: Colors.lightBlue.shade900,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        checkCurrentDay(focusedDay),
                        style: TextStyle(
                            color: Colors.black26,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )),
              EventBox(),
              EventBox(),
              EventBox(),
              EventBox(),
              EventBox(),
            ],
          ),
        ),
      ),
    );
  }
}
