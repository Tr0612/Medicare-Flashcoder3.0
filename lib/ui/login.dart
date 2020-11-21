import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:medicare/helper/auth_helper.dart';

class LoginPageMQ extends StatefulWidget {
  @override
  _LoginPageMQState createState() => _LoginPageMQState();
}

class _LoginPageMQState extends State<LoginPageMQ> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.maxWidth > 1200){
        return LoginPageDesktop();
      }
      else if(constraints.maxWidth>800 && constraints.maxWidth <1200){
        return LoginPageTablet();
      }
      else{
        return LoginPageMobile();
      }
    });
  }
}


class LoginPageMobile extends StatefulWidget {
  @override
  State createState() => LoginPageMobileState();
}

class LoginPageMobileState extends State<LoginPageMobile> {
  TextEditingController _emailController, _pwController;
  FocusNode _emailFocus, _pwFocus;

  // Initially password is obscure
  bool _obscureText = true;
  String _password;
  String _email;

  bool isValidEmail() {
    if ((_email == null) || (_email.length == 0)) {
      return true;
    }
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email);
  }

  bool isValidPassword() {
    if ((_password == null) || (_password.length == 0)) {
      return true;
    }
    return (_password?.length > 2);
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _validate() {
    setState(() {
      _email = _emailController.text;
      _password = _pwController.text;
    });
  }

  Future<void> performLogin() async {
    if (_emailController.text.isEmpty ||
        _pwController.text.isEmpty) {
      return "Email,password empty";
    }
   auth.User user;
    try {
     user = await AuthHelper.signInWithEmail(
          email: _emailController.text,
          password: _pwController.text);
     if ( user != null) {
       print("Login successfull");
     }


    } on Exception catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Container(
              color: Colors.black.withOpacity(1),
              child: AlertDialog(
                title: Text("Login Error"),
                content: Text("The Username/Password is incorrect. Please try again."),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Close"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            );
          });
      print("Error:${e}");

    }

  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _pwController = TextEditingController();
    _emailFocus = FocusNode();
    _pwFocus = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 0, top: 30),
                child: Image.asset(
                  "assets/images/logo2.jpeg",
                  width: 120,
                  height: 120,
                ),
              ),
              Container(
                  padding: EdgeInsets.only(
                    left: 0,
                  ),
                  child: Image.asset(
                    "assets/images/doctor.png",
                    width: 300,
                    height: 300,
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  child: TextField(
                    focusNode: _emailFocus,
                    controller: _emailController,
                    obscureText: false,
                    keyboardType:
                        TextInputType.emailAddress, //show email keyboard
                    textInputAction: TextInputAction.next,
                    onSubmitted: (input) {
                      _emailFocus.unfocus();
                      _email = input;
                      FocusScope.of(context).requestFocus(_pwFocus);
                    },
                    onTap: _validate,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.deepPurpleAccent),
                        borderRadius: new BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.deepPurpleAccent),
                        borderRadius: new BorderRadius.circular(25.7),
                      ),
                      hintText: 'Email',
                      focusColor: Colors.deepPurpleAccent,
                      hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.deepPurpleAccent,
                      ),
                      errorText:
                          isValidEmail() ? null : "Invalid Email Address",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  child: TextField(
                    focusNode: _pwFocus,
                    controller: _pwController,
                    obscureText: _obscureText,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (input) {
                      _pwFocus.unfocus();
                      _password = input;
                      performLogin();
                    },
                    onTap: _validate,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.deepPurpleAccent),
                        borderRadius: new BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.deepPurpleAccent),
                        borderRadius: new BorderRadius.circular(25.7),
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.deepPurpleAccent,
                      ),
                      errorText:
                          isValidPassword() ? null : "Password too short.",
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.deepPurpleAccent,
                        ),
                        onPressed: _toggle,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  performLogin();
                },
                child: Container(
                  margin: EdgeInsets.only(left:0,top: 30),
                  child: FlatButton(
                    height: 45,
                    minWidth: 220,
                    color: const Color(0xf0899bf2),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20.0,color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    onPressed: performLogin,
                  ),
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPageTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Tablet constraint"),
    );
  }
}

class LoginPageDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Desktop Constraint"),
    );
  }
}
