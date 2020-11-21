import 'package:flutter/material.dart';


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
    return Container();
  }
}
