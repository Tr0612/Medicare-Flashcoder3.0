import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicare/ui/patients.dart';
import 'package:medicare/widgets.dart';
import 'package:sizer/sizer.dart';


class AddPatientMQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth>1280){
          return AddPatientDesktop();
        }
        else if(constraints.maxWidth>840 && constraints.maxHeight<1280){
          return AddPatientTablet();
        }
        else{
          return AddPatientMobile();
        }
      },
    );
  }
}

class AddPatientDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}

class AddPatientTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}

class AddPatientMobile extends StatelessWidget {

  TextStyle title = TextStyle(fontSize: 18,fontFamily: "CairoBold",fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.5));
  TextStyle desc =  TextStyle(fontSize: 16,fontFamily: "CairoBold",fontWeight: FontWeight.w500,color: Color.fromRGBO(102,127,255,1),);
  TextStyle hintStyle = TextStyle(color: Color.fromRGBO(24, 65, 255,1),fontSize: 14);
  TextStyle style = TextStyle(color: Color.fromRGBO(24, 65, 255,1),fontSize: 16);
  OutlineInputBorder outline = OutlineInputBorder(
    borderSide:
    new BorderSide(color: Color.fromRGBO(24, 65, 255,1)),
    //borderRadius: new BorderRadius.circular(25.7),
  );
  UnderlineInputBorder inputBorder = UnderlineInputBorder(
    borderSide:
    new BorderSide(color: Color.fromRGBO(24, 65, 255,1)),
    borderRadius: new BorderRadius.circular(25.7),
  );
  Color focuscolor =  Color.fromRGBO(24, 65, 255,1);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            fit: StackFit.passthrough,
            children: [
            Container(
              width: size.width,
              height: 270,
              color: Colors.transparent,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/detail_illustration.png",fit: BoxFit.fill,height: 220,width:size.width,),

                    ],
                  ),
                  Positioned(
                    top: 10,
                    child: IconButton(
                      icon: Icon(Icons.navigate_before,color: Colors.white,),
                      iconSize: 40,
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => PatientHomePageMobile()));
                      },
                    ),
                  ),
                ],
              ),

            ),
            Padding(
              padding: EdgeInsets.only(top: 180),
                child: Container(
                  height:size.height+200,
                  width:size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(35))
                ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Container(
                        height: 45,
                        width: size.width-40,
                        child: TextField(
                          style: style,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            focusedBorder: outline,
                            enabledBorder: inputBorder,
                            hintText: 'Patient Name',
                            contentPadding: EdgeInsets.symmetric(horizontal: 35),
                            focusColor: focuscolor,
                            hintStyle:hintStyle,
                            //errorText:isValidEmail() ? null : "Invalid Email Address",
                          ),
                        ),
                      ),
                      SizedBox(height: 14,),
                      Container(
                        height: 45,
                        width: size.width-40,
                        child: TextField(
                          style: style,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            focusedBorder: outline,
                            enabledBorder: inputBorder,
                            hintText: 'Patient ID',
                            contentPadding: EdgeInsets.symmetric(horizontal: 35),
                            focusColor: focuscolor,
                            hintStyle:hintStyle,
                            //errorText:isValidEmail() ? null : "Invalid Email Address",
                          ),
                        ),
                      ),
                      SizedBox(height: 14,),
                      Container(
                        height: 45,
                        width: size.width-40,
                        child: TextField(
                          style: style,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            focusedBorder: outline,
                            enabledBorder: inputBorder,
                            hintText: 'Email',
                            contentPadding: EdgeInsets.symmetric(horizontal: 35),
                            focusColor: focuscolor,
                            hintStyle:hintStyle,
                            //errorText:isValidEmail() ? null : "Invalid Email Address",
                          ),
                        ),
                      ),
                      SizedBox(height: 14,),
                      Container(
                        height: 45,
                        width: size.width-40,
                        child: TextField(
                          style: style,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            focusedBorder: outline,
                            enabledBorder: inputBorder,
                            hintText: 'Password',
                            contentPadding: EdgeInsets.symmetric(horizontal: 35),
                            focusColor: focuscolor,
                            hintStyle:hintStyle,
                            //errorText:isValidEmail() ? null : "Invalid Email Address",
                          ),
                        ),
                      ),
                      SizedBox(height: 14,),
                      Container(
                        height: 45,
                        width: size.width-40,
                        child: TextField(
                          style: style,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            focusedBorder: outline,
                            enabledBorder: inputBorder,
                            hintText: 'Confirm Password',
                            contentPadding: EdgeInsets.symmetric(horizontal: 35),
                            focusColor: focuscolor,
                            hintStyle:hintStyle,
                            //errorText:isValidEmail() ? null : "Invalid Email Address",
                          ),
                        ),
                      ),
                      SizedBox(height: 14,),
                      Container(
                        height: 45,
                        width: size.width-40,
                        child: TextField(
                          style: style,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            focusedBorder: outline,
                            enabledBorder: inputBorder,
                            hintText: 'Contact No',
                            contentPadding: EdgeInsets.symmetric(horizontal: 35),
                            focusColor: focuscolor,
                            hintStyle:hintStyle,
                            //errorText:isValidEmail() ? null : "Invalid Email Address",
                          ),
                        ),
                      ),
                      SizedBox(height: 14,),
                      Container(
                        height: 45,
                        width: size.width-40,
                        child: TextField(
                          style: style,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusedBorder: outline,
                            enabledBorder: inputBorder,
                            hintText: 'Age',
                            contentPadding: EdgeInsets.symmetric(horizontal: 35),
                            focusColor: focuscolor,
                            hintStyle:hintStyle,
                            //errorText:isValidEmail() ? null : "Invalid Email Address",
                          ),
                        ),
                      ),
                      SizedBox(height: 14,),
                      Container(
                        height: 45,
                        width: size.width-40,
                        child: TextField(
                          style: style,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            focusedBorder: outline,
                            enabledBorder: inputBorder,
                            hintText: 'Gender',
                            contentPadding: EdgeInsets.symmetric(horizontal: 35),
                            focusColor: focuscolor,
                            hintStyle:hintStyle,
                            //errorText:isValidEmail() ? null : "Invalid Email Address",
                          ),
                        ),
                      ),
                      SizedBox(height: 14,),
                      Container(
                        height: 45,
                        width: size.width-40,
                        child: TextField(
                          style: style,
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            focusedBorder: outline,
                            enabledBorder: inputBorder,
                            hintText: 'Date of birth',
                            contentPadding: EdgeInsets.symmetric(horizontal: 35),
                            focusColor: focuscolor,
                            hintStyle:hintStyle,
                            //errorText:isValidEmail() ? null : "Invalid Email Address",
                          ),
                        ),
                      ),
                      SizedBox(height: 14,),
                      Container(
                        height: 45,
                        width: size.width-40,
                        child: TextField(
                          style: style,
                          keyboardType: TextInputType.streetAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            focusedBorder: outline,
                            enabledBorder: inputBorder,
                            hintText: 'Address',
                            contentPadding: EdgeInsets.symmetric(horizontal: 35),
                            focusColor: focuscolor,
                            hintStyle:hintStyle,
                            //errorText:isValidEmail() ? null : "Invalid Email Address",
                          ),
                        ),
                      ),
                      SizedBox(height: 14,),
                      Container(
                        height: 45,
                        width: size.width-40,
                        child: TextField(
                          style: style,
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            focusedBorder: outline,
                            enabledBorder: inputBorder,
                            hintText: 'Consultated Date',
                            contentPadding: EdgeInsets.symmetric(horizontal: 35),
                            focusColor: focuscolor,
                            hintStyle:hintStyle,
                            //errorText:isValidEmail() ? null : "Invalid Email Address",
                          ),
                        ),
                      ),
                      SizedBox(height: 18,),
                      Container(
                        height: 80,
                        width: size.width-40,
                        child: TextField(
                         expands: true,
                          maxLines: null,
                          style: style,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            focusedBorder: outline,
                            enabledBorder: inputBorder,
                            hintText: 'Aliments',
                            contentPadding: EdgeInsets.symmetric(horizontal: 35),
                            focusColor: focuscolor,
                            hintStyle:hintStyle,
                            //errorText:isValidEmail() ? null : "Invalid Email Address",
                          ),
                        ),
                      ),
                      SizedBox(height: 18,),
                      Container(
                        height: 80,
                        width: size.width-40,
                        child: TextField(
                          expands: true,
                          maxLines: null,
                          style: style,
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            focusedBorder: outline,
                            enabledBorder: inputBorder,
                            hintText: 'Medications',
                            contentPadding: EdgeInsets.symmetric(horizontal: 35),
                            focusColor: focuscolor,
                            hintStyle:hintStyle,
                            //errorText:isValidEmail() ? null : "Invalid Email Address",
                          ),
                        ),
                      ),
                      SizedBox(height: 12,),
                      GestureDetector(
                        onTap: () {
                          //performLogin();
                        },
                        child: Container(
                          height: 40,
                          width: size.width-260,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(24, 65, 255,0.4),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          margin: EdgeInsets.only(left:0,top: 30),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 38,vertical: 3),
                            child: Text(
                              "Submit",
                              style: TextStyle(fontSize: 17,color: Color.fromRGBO(24, 65, 255,1),fontWeight: FontWeight.w400,fontFamily: "CairoBold"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            ],
          ),
        ),
      ),
    );
  }
}
