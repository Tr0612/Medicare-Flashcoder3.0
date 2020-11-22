import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicare/ui/adminhome.dart';
import 'package:medicare/ui/appointments/appointmentscreen.dart';
import 'package:medicare/ui/appointments/calender.dart';


class AppointmentHomeMQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth>1280){
          return AppointmentHomePageDesktop();
        }
        else if(constraints.maxWidth>840 && constraints.maxHeight<1280){
          return AppointmentHomePageTablet();
        }
        else{
          return AppointmentHomePageMobile();
        }
      },
    );
  }
}

class AppointmentHomePageDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AppointmentHomePageTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AppointmentHomePageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.navigate_before, color: Colors.white,size: 40,),
            onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>AdminHomePageMobile())),
          ),
          toolbarHeight: 100,
          backgroundColor: Colors.pinkAccent,
          elevation: 10,
          bottom: TabBar(
              labelColor: Colors.pinkAccent,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                  color: Colors.white),
              tabs: <Widget>[

                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Appointment",style: TextStyle(fontFamily: 'CairoBold',letterSpacing:0.3,fontSize: 18,fontWeight:FontWeight.w500),),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Recent",style: TextStyle(fontFamily: 'CairoBold',letterSpacing:0.1,fontSize: 18,fontWeight:FontWeight.w500)),
                  ),
                ),
              ]),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              AppointmentScreen(),
              DateTimePicker(),
            ],
          )
        ) ,
      ),
    );
  }
}


