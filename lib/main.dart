import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medicare/helper/auth_helper.dart';
import 'package:medicare/ui/adminhome.dart';
import 'package:medicare/ui/login.dart';
import 'package:medicare/ui/splash.dart';
import 'package:splashscreen/splashscreen.dart';

//TODO adminhom ui/home ui/utlis authhelper/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Based Auth',
      //home: AdminHomePageMQ(),
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.white,
      seconds: 4,
      navigateAfterSeconds: new MainScreen(),
      image: new Image.asset(
        "assets/images/logo2.jpeg",
      ),
      loadingText: Text("Get ready for best app"),
      photoSize: 100.0,
      loaderColor: Colors.deepPurpleAccent,
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            UserHelper.saveUser(snapshot.data);
            return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(snapshot.data.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  final userDoc = snapshot.data;
                  final user = userDoc.data();
                  if (user['role'] == 'doctor') {
                    return AdminHomePageMQ();
                  } else {
                    return Scaffold(
                      backgroundColor: Colors.black.withOpacity(0),
                      body: AlertDialog(
                        title: Text("Login Error"),
                        content: Text(
                            "The Username/Password is incorrect. Please try again."),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Close"),
                            onPressed: () {
                              AuthHelper.logOut();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => MainScreen()));
                            },
                          )
                        ],
                      ),
                    );
                  }
                } else {
                  return SplashPage();
                }
              },
            );
          }
          return LoginPageMQ();
        });
  }
}
