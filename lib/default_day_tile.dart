import 'package:calendarro/calendarro.dart';
import 'package:calendarro/date_utils.dart';
import 'package:calendarro/dot.dart';
import 'package:flutter/material.dart';

import 'calendarro.dart';

const Color colorGreen = const Color(0xffD0DB98);
const Color colorOrange = const Color(0xffF5AE3C);

class CalendarroDayItem extends StatelessWidget {
  CalendarroDayItem(
      {@required this.date,
      @required this.calendarroState,
      @required this.onTap,
      @required this.list});

  final DateTime date;
  CalendarroState calendarroState;
  final DateTimeCallback onTap;
  final List<MiniIcons> list;

  @override
  Widget build(BuildContext context) {
    bool isWeekend = DateUtils.isWeekend(date);
    bool daySelected = calendarroState.isDateSelected(date);
    var textColor =
        daySelected ? Colors.white : (isWeekend ? Colors.grey : Colors.black);
    FontWeight fontWeight = daySelected ? FontWeight.w800 : FontWeight.w600;
    bool isToday = DateUtils.isToday(date);
    calendarroState = Calendarro.of(context);

    BoxDecoration boxDecoration;
    if (daySelected) {
      boxDecoration = BoxDecoration(
          color: const Color(0xffF37D86),
          borderRadius: BorderRadius.circular(4));
    } else if (isToday) {
      boxDecoration = BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1.0,
          ),
          shape: BoxShape.circle);
    }

    bool isNotesAvailable = list.contains(MiniIcons.notes);
    bool isMoodAvailable = list.contains(MiniIcons.moods);
    bool isSymptomAvailable = list.contains(MiniIcons.symptoms);
    // print(
    //     'CalendarroDayItem -------   ${date.day} ---  ${list.length}!--\nisNotesAvailable---$isNotesAvailable--------number-----$number---------');
    return Expanded(
        child: GestureDetector(
      child: Container(
        margin: EdgeInsets.all(2),
        padding: EdgeInsets.only(top: 11, left: 5, right: 5, bottom: 9),
        alignment: Alignment.topCenter,
        height: 50.0,
        width: 40.0,
        decoration: boxDecoration,
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                isNotesAvailable
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 3),
                          child: Image.asset(
                              daySelected
                                  ? 'assets/mini_icon_note_clicked.png'
                                  : 'assets/mini_icon_note.png',
                              width: 10,
                              package: 'calendarro'),
                        ),
                      )
                    : Container(),
                Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: DotsContainer(
                    isMoodAvailable,
                    isSymptomAvailable,
                    (!daySelected ? colorGreen : Colors.white),
                    (!daySelected ? colorOrange : Colors.white),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "${date.day}",
                textAlign: TextAlign.center,
                style: TextStyle(color: textColor, fontWeight: fontWeight),
              ),
            ),
          ],
        ),
      ),
      onTap: handleTap,
      behavior: HitTestBehavior.translucent,
    ));
  }

  void handleTap() {
    if (onTap != null) {
      onTap(date);
    }

    calendarroState.setSelectedDate(date);
    calendarroState.setCurrentDate(date);
  }
}
