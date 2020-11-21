import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicare/ui/adminhome.dart';
import 'package:medicare/ui/patients.dart';

class ExistingPatientMQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1280) {
          return ExistingPatientDesktop();
        } else if (constraints.maxWidth > 840 && constraints.maxHeight < 1280) {
          return ExistingPatientTablet();
        } else {
          return ExistingPatientMobile();
        }
      },
    );
  }
}

class ExistingPatientDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ExistingPatientTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ExistingPatientMobile extends StatefulWidget {
  @override
  _ExistingPatientMobileState createState() => _ExistingPatientMobileState();
}

class _ExistingPatientMobileState extends State<ExistingPatientMobile> {
  TextStyle title = TextStyle(
      fontSize: 18, fontFamily: "CairoBold", fontWeight: FontWeight.w500);
  TextStyle desc = TextStyle(
      fontSize: 16,
      fontFamily: "CairoBold",
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(0.5));
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Positioned(
                      top: 0,
                      left: -15,
                      child: IconButton(
                        icon: Icon(
                          Icons.navigate_before,
                          color: Colors.black,
                        ),
                        iconSize: 40,
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      PatientHomePageMobile()));
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Container(
                              height: 160,
                              width: 110,
                              //color: Colors.red,
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Image.asset(
                                    "assets/images/doctor2.jpg",
                                    height: 160,
                                    width: 100,
                                    fit: BoxFit.fitHeight,
                                  ))),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 50),
                          width: 200,
                          height: 220,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Patient Name",
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 26, fontFamily: "Cairo"),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "#ID20200909",
                                style:
                                    TextStyle(fontSize: 19, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 16),
                                    child: Container(
                                        height: 45,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                255, 77, 106, 0.3),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Icon(
                                          Icons.email,
                                          color: Colors.red,
                                        )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 16),
                                    child: Container(
                                        height: 45,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                25, 140, 255, 0.3),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Icon(
                                          Icons.call,
                                          color: Colors.blueAccent,
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Patient Records",
                  style: TextStyle(
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.w600,
                      fontSize: 21,
                      color: Colors.black.withOpacity(0.7)),
                ),
                SizedBox(
                  height: 26,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Name",
                      style: title,
                    ),
                    SizedBox(
                      width: 48,
                    ),
                    Container(
                      color: Colors.transparent,
                      width: 250,
                      height: 40,
                      child: Text(
                        "PatientName",
                        style: desc,
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Age",
                      style: title,
                    ),
                    SizedBox(
                      width: 64,
                    ),
                    Container(
                      color: Colors.transparent,
                      width: 250,
                      height: 40,
                      child: Text(
                        "21",
                        style: desc,
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Gender",
                      style: title,
                    ),
                    SizedBox(
                      width: 38,
                    ),
                    Container(
                      color: Colors.transparent,
                      width: 250,
                      height: 40,
                      child: Text(
                        "Male",
                        style: desc,
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "DOB",
                      style: title,
                    ),
                    SizedBox(
                      width: 59,
                    ),
                    Container(
                      color: Colors.transparent,
                      width: 250,
                      height: 40,
                      child: Text(
                        "01-01-2000",
                        style: desc,
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Address",
                      style: title,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      color: Colors.transparent,
                      width: 250,
                      height: 90,
                      child: Text(
                        "No.73,Rajalakshmi nagar,Moulivakkam,Porur,chennai -116",
                        style: desc,
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Consultated",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: "CairoBold",
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      color: Colors.transparent,
                      width: 220,
                      height: 40,
                      child: Text(
                        "02-02-2020",
                        style: desc,
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Aliments",
                      style: title,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      color: Colors.transparent,
                      width: 243,
                      height: 160,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          "Coronavirus disease 2019 (COVID-19) is a contagious respiratory and vascular disease caused by severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2). First identified in Wuhan, China, it has caused an ongoing pandemic.Common symptoms include fever, cough, fatigue, breathing difficulties, and loss of smell and taste. Symptoms begin one to fourteen days after exposure to the virus. While most people have mild symptom…",
                          style: desc,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Medication",
                      style: title,
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Container(
                      color: Colors.transparent,
                      width: 243,
                      height: 160,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          "019 (COVID-19) is a contagious respiratory and vascular disease caused by severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2). First identified in Wuhan, China, it has caused an ongoing pandemic.Common symptoms include fever, cough, fatigue, breathing difficulties, and loss of smell and taste. Symptoms begin one to fourteen days after exposure to the virus. While most people have mild symptom…",
                          style: desc,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(color: Colors.grey),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      child: Container(
                          height: 45,
                          width: 155,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.pink, width: 2),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit,
                                color: Colors.pink,
                              ),
                              Text(
                                "Update",
                                style: TextStyle(
                                    color: Colors.pink,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      child: Container(
                          height: 45,
                          width: 155,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(166, 77, 255, 0.3),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.chat,
                                color: Colors.deepPurple,
                              ),
                              Text(
                                "Chat",
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
