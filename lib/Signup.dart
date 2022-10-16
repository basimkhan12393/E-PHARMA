import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';

class SignUP extends StatefulWidget {
  const SignUP({Key? key}) : super(key: key);

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {

  final TextEditingController _emailtec1 = TextEditingController();
  final TextEditingController _pwdtec1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration'),),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(

                  children: [
                    TextFormField(style: TextStyle(color: Colors.black),

                      controller: _emailtec1,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: '   Email Address',
                          hintStyle: TextStyle(color: Colors.black)


                      ),
                      textInputAction: TextInputAction.next
                      ,
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    TextFormField(style: TextStyle(color: Colors.black),
                      controller: _pwdtec1,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.brown),
                        iconColor: Colors.brown,
                        border: InputBorder.none,
                        hintText: '   Password',
                          hintStyle: TextStyle(color: Colors.black)

                      ),
                      textInputAction: TextInputAction.done,
                      obscureText: true,

                    ),

                    InkWell(onTap: (){
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: _emailtec1.text, password: _pwdtec1.text).then((value) {
                        print("Created");
                        var route4 = MaterialPageRoute(builder: (BuildContext context)
                        => const LoginPage(),);
                        Navigator.of(context).push(route4);
                      });

                    },
                      child: Container(
                          height: 30,
                          width: 300,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                              color: Colors.brown),


                          child: const Center(
                            child: Text('Register',textAlign:TextAlign.center,style: TextStyle(color: Colors.white),),)),),


                  ],

                ),

              ),


            ),
            SizedBox(height: 150,),
            Text('Once you Click Register Your Account will be Created'),
          ],
        ),
      ),
    );
  }
}
