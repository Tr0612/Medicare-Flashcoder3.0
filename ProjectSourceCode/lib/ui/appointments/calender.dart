import 'dart:async';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatefulWidget {
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  double _height;
  double _width;

  String _setTime, _setDate;

  String _hour, _minute, _time;

  String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
      body: Container(
        width: _width,
        height: _height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 5),
                    child: Text(
                      'Book Date',
                      style: TextStyle(
                          fontFamily: 'CairoBold',
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Container(
                        width: _width-200,
                        height: 50,
                        margin: EdgeInsets.only(top: 30),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,width: 1.5),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: TextFormField(
                          style: TextStyle(fontSize: 22.0, color: Colors.grey,fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                          enabled: false,
                          keyboardType: TextInputType.text,
                          controller: _dateController,
                          onSaved: (String val) {
                            _setDate = val;
                          },
                          decoration: InputDecoration(

                              disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                              // labelText: 'Time',
                              contentPadding: EdgeInsets.all(10.0)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                          _selectDate(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,top: 25),
                          child: Icon(Icons.date_range,color: Colors.grey,size: 30,),
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 5),
                    child: Text(
                      'Book Time',
                      style: TextStyle(
                          fontFamily: 'CairoBold',
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _selectTime(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Container(
                        width: _width-200,
                        height: 50,
                        margin: EdgeInsets.only(top: 30),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey,width: 1.5),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: TextFormField(
                          style: TextStyle(fontSize: 22.0, color: Colors.grey,fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                          enabled: false,
                          keyboardType: TextInputType.text,
                          controller: _timeController,
                          onSaved: (String val) {
                            _setDate = val;
                          },
                          decoration: InputDecoration(

                              disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                              // labelText: 'Time',
                              contentPadding: EdgeInsets.all(10.0)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                          _selectTime(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,top: 25),
                          child: Icon(Icons.access_time,color: Colors.grey,size: 30,),
                        ),
                      )),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}



