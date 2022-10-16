
import 'package:consutancy/first.dart';

import 'bak.dart';
import 'forgot_pwd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Signup.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailtec = TextEditingController();
  final TextEditingController _pwdtec = TextEditingController();
  @override
  void dispose(){
    _emailtec.dispose();
    _pwdtec.dispose();

    super.dispose();
  }
  Widget build(BuildContext context) {
    return Material(

      child: Stack(
          children: [
            BackgroundImage(),
            Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,
                body:SafeArea(
                  child: Column(
                    children: [

                      const SizedBox(
                        height: 150,
                        child: Center(
                          child: Text('SIGN IN',
                            textAlign:TextAlign.justify,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,


                            ) ,
                          ),
                        ),
                      ),
                      Text('Consultancy',style: TextStyle(fontSize:50,color: Colors.white,fontStyle: FontStyle.italic),),
                      SizedBox(height: 100,),

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

                                controller: _emailtec,
                                decoration: const InputDecoration(

                                  border: InputBorder.none,
                                  hintText: '   Email Address',
                                  hintStyle: TextStyle(color: Colors.black)


                                ),
                              ),
                              const Divider(
                                color: Colors.black,
                              ),
                              TextFormField(style: TextStyle(color: Colors.black),
                                controller: _pwdtec,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '   Password',
                                    hintStyle: TextStyle(color: Colors.black)

                                ),
                                obscureText: true,
                              ),

                              InkWell(onTap: signin,

                                child: Container(
                                    height: 30,
                                    width: 300,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                                        color: Colors.yellow),


                                    child: const Center(
                                      child: Text('Login',textAlign:TextAlign.center,style: TextStyle(color: Colors.black),),)),)

                            ],

                          ),

                        ),


                      ),
                      const SizedBox(height: 15,),
                      InkWell(onTap: (){
                        var route2 = MaterialPageRoute(builder: (BuildContext context) => const ForgotPwd(),);

                        Navigator.of(context).push(route2);
                      },
                        child: const Center(child: Text('                                                  forgot password',
                          textAlign:TextAlign.end,style: TextStyle(
                              color: Colors.white
                          ),),),),

                      const SizedBox(
                        height: 34,
                      ),
                      InkWell(onTap: (){},
                        child: const Center(child: Text('Do not have an account yet?',
                          textAlign:TextAlign.end,style: TextStyle(
                              color: Colors.white
                          ),),),),
                      const SizedBox(
                        height: 5,
                      ),
                      InkWell(onTap: (){
                        var route3 = MaterialPageRoute(builder: (BuildContext context) => const SignUP(),);

                        Navigator.of(context).push(route3);
                      },
                        child: const Center(child: Text('SIGNUP NOW',
                          textAlign:TextAlign.end,style: TextStyle(
                              color: Colors.white
                          ),),),),
                      const SizedBox(
                        height: 5,
                      ),




                    ],
                  ),

                )),

          ]

      ),

    );



  }
  Future signin() async{
    showDialog(context: context,
        barrierDismissible: false,
        builder: (context) =>   Center(child: CircularProgressIndicator(),));
   try {
     await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: _emailtec.text.trim(),
         password: _pwdtec.text.trim());
     var route1 = MaterialPageRoute(
       builder: (BuildContext context) => const MyStatefulWidget(),);
     Navigator.of(context).push(route1);
   }on FirebaseAuthException catch(e){
     print(e);
   }

   // navigatorKey.currentState!popUntil((route ) => route.is First())
  }
}


