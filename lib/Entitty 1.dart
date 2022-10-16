import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consutancy/bak2.dart';
import 'package:consutancy/first.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';


class OpenWhatsapp0 extends StatefulWidget {
  var data;

  OpenWhatsapp0({Key? key,required this.data}) : super(key: key);

  @override
  State<OpenWhatsapp0> createState() => _OpenWhatsapp0State();
}

class _OpenWhatsapp0State extends State<OpenWhatsapp0> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          BackgroundImage2(),
        Container(
        height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(color: Colors.transparent),
    child: Column(
    children: [
    SizedBox(height: 50,),
    CircleAvatar(
    backgroundColor: Colors.brown,
    radius: 60,
    child: ClipRRect(
    child: Image.asset('assets/1.jpg'),
    borderRadius: BorderRadius.circular(80.0),
    ),
    ),
    SizedBox(height: 100,),
    Text(
    '${widget.data['Name']}',
    style: TextStyle(color: Colors.black,
    fontSize: 30,fontStyle: FontStyle.italic),
    ),
    Text(
    '${widget.data['Dest']}',
    style: TextStyle(color: Colors.black,
    fontSize: 30,fontStyle: FontStyle.italic),
    ),
    SizedBox(height: 30,),
    Text(
    'Contact#${widget.data['Number']}',
    style: const TextStyle(color: Colors.black,
    fontSize: 25,fontStyle: FontStyle.italic),
    ),
    SizedBox(height: 15,),
    Text(
    ' Consultation Price is:${widget.data['Price']}',
    style: const TextStyle(color: Colors.black,
    fontSize: 25,fontStyle: FontStyle.italic),
    ),

    InkWell(
    onTap: () async {
      
      var whatsapp =widget.data['Number'];
      var whatsappURl_Android = "whatsapp://send?phone=$whatsapp&text=hi I want consultancy from you i am referred from E PHARMA ";

      if (await launchUrlString(whatsappURl_Android)) {
      await launchUrlString(whatsappURl_Android);
      }
    }
      ,
    child: Column(
    children: [
    SizedBox(height: 50,),
    Container(
      margin: EdgeInsets.all(15),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

    Center(child: Text('CLICK TO GET CONSULTANCY'))
    ],
    ),

    height: 100,
    width: 330,
    decoration: BoxDecoration(
    color: Colors.brown,
    borderRadius: BorderRadius.circular(10)

    ),
    ),
    SizedBox(height: 10,),

    ],
    ),
    ),

    ],
    ),
    )
        ],
      ),
    );

//
  }
}