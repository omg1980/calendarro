import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalendarroWeekdayLabelsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: Text("M", textAlign: TextAlign.center,style: TextStyle(fontSize: 12, color: Colors.black38),)),
        Expanded(child: Text("T", textAlign: TextAlign.center,style: TextStyle(fontSize: 12, color: Colors.black38),)),
        Expanded(child: Text("W", textAlign: TextAlign.center,style: TextStyle(fontSize: 12, color: Colors.black38),)),
        Expanded(child: Text("T", textAlign: TextAlign.center,style: TextStyle(fontSize: 12, color: Colors.black38),)),
        Expanded(child: Text("F", textAlign: TextAlign.center,style: TextStyle(fontSize: 12, color: Colors.black38),)),
        Expanded(child: Text("S", textAlign: TextAlign.center,style: TextStyle(fontSize: 12, color: Colors.black38),)),
        Expanded(child: Text("S", textAlign: TextAlign.center,style: TextStyle(fontSize: 12, color: Colors.black38),)),
      ],
    );
  }
}