import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicare/ui/addPatient.dart';
import 'package:medicare/ui/adminhome.dart';
import 'package:medicare/ui/existingpatient.dart';
import 'package:medicare/widgets.dart';


class PatientsHomeMQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth>1280){
          return PatientHomePageDesktop();
        }
        else if(constraints.maxWidth>840 && constraints.maxHeight<1280){
          return PatientHomePageTablet();
        }
        else{
          return PatientHomePageMobile();
        }
      },
    );
  }
}

class PatientHomePageDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PatientHomePageTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PatientHomePageMobile extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO	(240,255,255,1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Container(
                width: size.width,
                height: 270,
                color: Colors.white,
                child: Image.asset("assets/images/patient2.jpg",fit: BoxFit.cover,height: size.height,),
              ),
              Positioned(
                top: 18,
                child: IconButton(
                  icon: Icon(Icons.navigate_before,color: Colors.white,),
                  iconSize: 40,
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AdminHomePageMobile()));
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 245),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> AddPatientMobile()));
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal:size.width/4),
                        child: Container(
                          width: size.width/2,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(20)),
                           gradient: LinearGradient(
                               begin: Alignment.topRight,
                               end: Alignment.bottomLeft,
                               colors: [
                                 Color.fromRGBO(135,206,250,1),
                                 Colors.blue,
                               ]
                           ),
                         ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Add Patient",style: TextStyle(fontFamily: "Cairo",fontWeight:FontWeight.w700,fontSize: 22,color: Colors.white),),
                              Icon(Icons.add,color: Colors.white,size: 25,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 285),
                child: Container(
                  width: size.width,
                  height: 500,
                  decoration: BoxDecoration(
                  //Color.fromRGBO(245, 245, 245, 0.1),
                    borderRadius: BorderRadius.all(Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:22,right:22,top: 25),
                        child: Container(
                          height: 50,
                          child: TextField(
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20,top: 10),
                              fillColor: Colors.grey.withOpacity(0.1),
                              filled: true,
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                new BorderSide(color: Colors.grey),
                                borderRadius: new BorderRadius.circular(5),
                              ),
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 20),
                              suffixIcon: Icon(
                                Icons.search,
                                size: 25,
                                color: Colors.grey,
                              ),
                          ),
                      ),
                        ),
                      ),
                      SizedBox(height: 16,),
                      Container(
                        width: size.width,
                        color: Colors.white,
                        height: 400,
                        child: ListView(
                          children: [
                           ListTile(
                             title: Text("Patient Name",style: TextStyle(fontFamily:"Cairo",color: Colors.black,fontSize: 22),),
                             subtitle: Text("#ID20200909",style: TextStyle(color: Colors.grey,fontSize: 14),),
                             trailing: Icon(Icons.navigate_next,color: Colors.blueAccent,size: 30,),
                             leading: Image.asset("assets/images/doctorvector.png"),
                             selectedTileColor: Colors.pinkAccent,
                             onTap: (){
                               Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> ExistingPatientMQ()));
                             },
                           )
                          ],
                        ),
                      ), //Add Patient Details here
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
