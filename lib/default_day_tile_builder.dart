import 'package:calendarro/calendarro.dart';
import 'package:calendarro/default_day_tile.dart';
import 'package:flutter/material.dart';

import 'calendarro.dart';

class DefaultDayTileBuilder extends DayTileBuilder {
  final Map<int, List<MiniIcons>> activitiesList;
  DefaultDayTileBuilder(this.activitiesList);

  @override
  Widget build(BuildContext context, DateTime date, DateTimeCallback onTap) {
    // print('calendartro DefaultDayTileBuilder   ----day -  ${date.day} - dayfrom list - ${activitiesList[date.day]}');
    return CalendarroDayItem(
      date: date,
      calendarroState: Calendarro.of(context),
      onTap: onTap,
      list: activitiesList[date.day]??[],
    );
  }
}
