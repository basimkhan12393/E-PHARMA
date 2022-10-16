import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';



class ForgotPwd extends StatefulWidget {
  const ForgotPwd({Key? key}) : super(key: key);

  @override
  State<ForgotPwd> createState() => _ForgotPwdState();
}

class _ForgotPwdState extends State<ForgotPwd> {
  final TextEditingController _emailtec1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reset Your Password'),),
      body: Center(
        child: Column(

          children: [
            SizedBox(height: 100,),Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: Column(

                children: [
                  Container( decoration: BoxDecoration(
                    color: Colors.white12.withOpacity(1),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),
                       topRight: Radius.circular(15)),
                  ),
                    child: TextFormField(style: TextStyle(color: Colors.black),
                      controller: _emailtec1,
                      decoration: const InputDecoration(

                        fillColor: Colors.red,
                        border: InputBorder.none,
                        hintText: '   Email Address',
                          hintStyle: TextStyle(color: Colors.black)


                      ),
                    ),
                  ),
                  InkWell(onTap: (){
                    FirebaseAuth.instance.sendPasswordResetEmail(
                        email: _emailtec1.text).then((value) {
                      print("Sent");
                      var route4 = MaterialPageRoute(builder: (BuildContext context)
                      => const LoginPage(),);
                      Navigator.of(context).push(route4);
                    });

                  },
                    child: Container(
                        height: 30,
                        width: 300,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                            color: Colors.brown),


                        child: const Center(
                          child: Text('Forgot password',textAlign:TextAlign.center,style: TextStyle(color: Colors.white)),)),),
SizedBox(height: 150,),
Text('You will Get the Email With Reset Link To Reset Your Password'),
                ],


              ),


            ),

          ],
        ),
      ),
    );
  }
}

