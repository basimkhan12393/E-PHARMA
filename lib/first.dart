import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consutancy/consultancy.dart';
import 'package:consutancy/pharmacy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';

import 'LoginPage.dart';
import 'lab.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final TextEditingController name = TextEditingController();
  final TextEditingController dest = TextEditingController();
  final TextEditingController number = TextEditingController();
  final TextEditingController price = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const Consultancy(),
    const Pharmacy(),
    const Lab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  void dispose(){
    name.dispose();
    number.dispose();
    price.dispose();
    dest.dispose();

    super.dispose();
  }
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async => false,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
              'Consultancy',
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                onPressed: () {
                  showDialog(

                    context: context,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      child: AlertDialog(
                        scrollable: false,
                        title: const Text('ACCOUNT INFORMATION'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(user.email!),
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                              color: Colors.yellow,
                              child: InkWell(
                                  onTap: () {
                                    signOut();
                                  },
                                  child: const Text(
                                    'Signout',
                                    style: TextStyle(color: Colors.black),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.create_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'Register with us as a doctor',
                        style: TextStyle(fontSize: 15),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  TextFormField(
                                    style: const TextStyle(color: Colors.black),
                                    controller: name,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '   Your Name',
                                        hintStyle: TextStyle(color: Colors.black)),
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                  TextFormField(
                                    style: const TextStyle(color: Colors.black),
                                    controller: dest,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '   Dest',
                                        hintStyle: TextStyle(color: Colors.black)),
                                  ),

                                  const Divider(
                                    color: Colors.black,
                                  ),
                                  TextFormField(
                                    style: const TextStyle(color: Colors.black),
                                    controller: number,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '  Phone Number',
                                        hintStyle: TextStyle(color: Colors.black)),
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                  TextFormField(
                                    style: const TextStyle(color: Colors.black),
                                    controller: price,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '  Consultation Price',
                                        hintStyle: TextStyle(color: Colors.black)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            height: 40,
                            width: 100,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(40)),
                                color: Colors.yellow),
                            child: InkWell(
                                onTap: () {
                                  if(name.text.isNotEmpty||dest.text.isNotEmpty||number.text.isNotEmpty||price.text.isNotEmpty) {
                                    Map<String, dynamic> data = {
                                      "Name": name.text,
                                      "Dest": dest.text,
                                      "Number": number.text,
                                      "Price": price.text,
                                    };
                                    FirebaseFirestore.instance
                                        .collection("new")
                                        .add(data);
                                  }
                                  Navigator.pop(context);
                  },

                                child: const Center(
                                    child: Text(
                                  'Register',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                ))),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.local_hospital_outlined),
                label: 'Consultancy',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Pharmacy',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.call),
                label: 'Lab',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
openwhatsapp0() async {
  var whatsapp = "+9203076750380";
  var whatsappURl_Android = "whatsapp://send?phone=$whatsapp&text=hi I want consultancy from you i am referred from E PHARMA ";

  if (await launchUrlString(whatsappURl_Android)) {
    await launchUrlString(whatsappURl_Android);
  }
}
openwhatsapp1() async {
  var whatsapp = "+9203013954114";
  var whatsappURl_Android = "whatsapp://send?phone=$whatsapp&text=hi I want consultancy from you i am referred from E PHARMA ";

  if (await launchUrlString(whatsappURl_Android)) {
    await launchUrlString(whatsappURl_Android);
  }
}
openwhatsapp2() async {
  var whatsapp = "+9203003716934";
  var whatsappURl_Android = "whatsapp://send?phone=$whatsapp&text=hi I want consultancy from you i am referred from E PHARMA ";

  if (await launchUrlString(whatsappURl_Android)) {
    await launchUrlString(whatsappURl_Android);
  }
}
openwhatsapp3() async {
  var whatsapp = "+9203028215332";
  var whatsappURl_Android = "whatsapp://send?phone=$whatsapp&text=hi I want consultancy from you i am referred from E PHARMA ";

  if (await launchUrlString(whatsappURl_Android)) {
    await launchUrlString(whatsappURl_Android);
  }
}
openwhatsapp4() async {
  var whatsapp = "+9203008243141";
  var whatsappURl_Android = "whatsapp://send?phone=$whatsapp&text=hi I want consultancy from you i am referred from E PHARMA ";

  if (await launchUrlString(whatsappURl_Android)) {
    await launchUrlString(whatsappURl_Android);
  }
}
openwhatsapp5() async {
  var whatsapp = "+9203036611398";
  var whatsappURl_Android = "whatsapp://send?phone=$whatsapp&text=hi I want consultancy from you i am referred from E PHARMA ";

  if (await launchUrlString(whatsappURl_Android)) {
    await launchUrlString(whatsappURl_Android);
  }
}
openwhatsapp6() async {
  var whatsapp = "+9203007917880";
  var whatsappURl_Android = "whatsapp://send?phone=$whatsapp&text=hi I want consultancy from you i am referred from E PHARMA ";

  if (await launchUrlString(whatsappURl_Android)) {
    await launchUrlString(whatsappURl_Android);
  }
}
openwhatsapp7() async {
  var whatsapp = "+9203421367648";
  var whatsappURl_Android = "whatsapp://send?phone=$whatsapp&text=hi I want consultancy from you i am referred from E PHARMA ";

  if (await launchUrlString(whatsappURl_Android)) {
    await launchUrlString(whatsappURl_Android);
  }
}
openwhatsapp8() async {
  var whatsapp = "+9203117330711";
  var whatsappURl_Android = "whatsapp://send?phone=$whatsapp&text=hi I want consultancy from you i am referred from E PHARMA ";

  if (await launchUrlString(whatsappURl_Android)) {
    await launchUrlString(whatsappURl_Android);
  }
}
openwhatsapp9() async {
  var whatsapp = "+9203181225380";
  var whatsappURl_Android = "whatsapp://send?phone=$whatsapp&text=hi I want consultancy from you i am referred from E PHARMA ";

  if (await launchUrlString(whatsappURl_Android)) {
    await launchUrlString(whatsappURl_Android);
  }
}

