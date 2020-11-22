import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicare/helper/auth_helper.dart';
import 'package:medicare/ui/aboutyou.dart';
import 'package:medicare/ui/appointments.dart';
import 'package:medicare/ui/patients.dart';
import 'package:medicare/ui/tasks.dart';
import 'package:medicare/widgets.dart';

class AdminHomePageMQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1280) {
          return AdminHomePageDesktop();
        } else if (constraints.maxWidth > 840 && constraints.maxHeight < 1280) {
          return AdminHomePageTablet();
        } else {
          return AdminHomePageMobile();
        }
      },
    );
  }
}

class AdminHomePageMobile extends StatefulWidget {
  @override
  _AdminHomePageMobileState createState() => _AdminHomePageMobileState();
}

class _AdminHomePageMobileState extends State<AdminHomePageMobile> {
  List<String> imageLinks = [
    "https://rb.gy/of5y9z",
    'https://rb.gy/lmljbi',
    'https://rb.gy/frqlso',
    "https://rb.gy/mhdufg"
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;

    TextStyle title = TextStyle(
        fontSize: 22,
        fontFamily: "Ubuntu",
        fontWeight: FontWeight.w500,
        color: Colors.pinkAccent);
    TextStyle desc = TextStyle(
        fontSize: 13,
        fontFamily: "Ubuntu",
        fontWeight: FontWeight.w500,
        color: Colors.grey);
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 320,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xFFC7B8F5), Colors.pinkAccent]),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            "Doctor Hub",
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: "Ubuntu",
                                foreground: Paint()
                                  ..shader = LinearGradient(
                                    colors: <Color>[
                                      Color(0xff8921aa),
                                      Color(0xff8921aa)
                                    ],
                                  ).createShader(
                                      Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            AuthHelper.logOut();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: IconButton(
                              icon: Icon(Icons.logout),
                              color: Color(0xff8921aa),
                              onPressed: () {
                                AuthHelper.logOut();
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: CarouselSlider(
                        height: 200.0,
                        items: imageLinks.map((imageLink) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      imageLink,
                                      fit: BoxFit.fill,
                                    ),
                                  ));
                            },
                          );
                        }).toList(),
                        reverse: false,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        initialPage: 0,
                        scrollDirection: Axis.horizontal,
                        pauseAutoPlayOnTouch: Duration(seconds: 3),
                        onPageChanged: (int pageNumber) {},
                        viewportFraction: 0.8,
                        enlargeCenterPage: true, //is false by default
                        aspectRatio: 16 /
                            9, //if height is not specified, then this value is used
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: Container(
                  width: width,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(245, 245, 245, 0.1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 25),
                        child: Text(
                          "Daily Check",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => PatientHomePageMobile()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 16),
                          child: Container(
                            width: size.width - 30,
                            height: 95,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Image.asset(
                                    "assets/images/hospitalisation.png",
                                    width: 60,
                                    height: 60,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 30, top: 23),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Patients", style: title),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 7),
                                        child: Text(
                                          "Review your patients",
                                          style: desc,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 62),
                                    child: IconButton(
                                      icon: Icon(Icons.navigate_next,
                                          color: Colors.pinkAccent),
                                      iconSize: 40,
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    PatientHomePageMobile()));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) =>
                                  AppointmentHomePageMobile()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 7),
                          child: Container(
                            width: size.width - 30,
                            height: 95,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Image.asset(
                                    "assets/images/task.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 30, top: 23),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Appointments", style: title),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 7),
                                        child: Text(
                                          "Check your appointments",
                                          style: desc,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 45),
                                    child: IconButton(
                                      icon: Icon(Icons.navigate_next,
                                          color: Colors.pinkAccent),
                                      iconSize: 40,
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    AppointmentHomePageMobile()));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => TaskHomePageMobile()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 7),
                          child: Container(
                            width: size.width - 30,
                            height: 95,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Image.asset(
                                    "assets/images/completed-task.png",
                                    width: 45,
                                    height: 45,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 30, top: 23),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("NotePad", style: title),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 7),
                                        child: Text(
                                          "Save your notes ",
                                          style: desc,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 89),
                                    child: IconButton(
                                      icon: Icon(Icons.navigate_next,
                                          color: Colors.pinkAccent),
                                      iconSize: 40,
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    TaskHomePageMobile()));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => AboutYouHomePageMobile()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 7),
                          child: Container(
                            width: size.width - 30,
                            height: 95,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Image.asset(
                                    "assets/images/doctorvector.png",
                                    width: 45,
                                    height: 45,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 30, top: 23),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("About you", style: title),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 7),
                                        child: Text(
                                          "Set your Details ",
                                          style: desc,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 89),
                                    child: IconButton(
                                      icon: Icon(Icons.navigate_next,
                                          color: Colors.pinkAccent),
                                      iconSize: 40,
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    AboutYouHomePageMobile()));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdminHomePageTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AdminHomePageDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

/*
Container(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          StreamBuilder(
                            stream:
                            FirebaseFirestore.instance.collection("users").snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasData && snapshot.data != null) {
                                final docs = snapshot.data.docs;
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: docs.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    final user = docs[index].data();
                                    return ListTile(
                                      title: Text(user['name'] ?? user['email']),
                                    );
                                  },
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
 */
