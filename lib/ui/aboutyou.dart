import 'package:flutter/material.dart';


class AboutYouHomePageMQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth>1200){
          return AboutYouHomePageDesktop();
        }
        else if(constraints.maxWidth>800 && constraints.maxHeight<1200){
          return AboutYouHomePageTablet();
        }
        else{
          return AboutYouHomePageMobile();
        }
      },
    );
  }
}

class AboutYouHomePageDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AboutYouHomePageTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AboutYouHomePageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
