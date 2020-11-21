import 'package:flutter/material.dart';


class TaskHomePageMQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth>1200){
          return TaskHomePageDesktop();
        }
        else if(constraints.maxWidth>800 && constraints.maxHeight<1200){
          return TaskHomePageTablet();
        }
        else{
          return TaskHomePageMobile();
        }
      },
    );
  }
}

class TaskHomePageDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TaskHomePageTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TaskHomePageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
