import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consutancy/Entitty%201.dart';
import 'package:consutancy/bak.dart';
import 'package:flutter/material.dart';
import 'first.dart';
import 'bak2.dart';

class Consultancy extends StatelessWidget {
  const Consultancy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Material(
        child: Stack(
          children: [
            const BackgroundImage2(),
            StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("new").snapshots(),
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot,
            ) {
              if (snapshot.hasData) {
                final data = snapshot.requireData;
                return ListView.builder(
                  // padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OpenWhatsapp0(data: data.docs[index],)));},
                          child: Container(
                            height: 100,
                            width: 330,
                            decoration: BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Text(
                                      '${data.docs[index]['Name']}',
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ),
                                // Text(
                                //   '${data.docs[index]['Dest']}',
                                //   style: TextStyle(color: Colors.white,
                                //       fontSize: 20),
                                // ),
                                //
                                // Text(
                                //   '${data.docs[index]['Number']}',
                                //   style:
                                //       const TextStyle(color: Colors.white, fontSize: 20),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
              // if (snapshot.data == null) return Text("null");

              return const CircularProgressIndicator();
            },
    ),
          ],
        ),
      );
  }
}

//   ListView(
//   children: [
//
//
//   ElevatedButton(
//
//     style: ElevatedButton.styleFrom(primary: Colors.transparent,elevation: 40),
//     onPressed: (){
//       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OpenWhatsapp0()));
//     }, child: Column(
//     children: [
//       SizedBox(height: 5,),
//       Container(
//
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 35),
//               child: Center(child: Text('Dr. Qamar Ali',style: TextStyle(color: Colors.white,fontSize: 30),)),
//             ),
//           ],
//         ),
//
//         height: 100,
//         width: 330,
//         decoration: BoxDecoration(
//
//             color: Colors.brown,
//             borderRadius: BorderRadius.circular(10)
//
//         ),
//       ),
//       SizedBox(height: 10,),
//
//     ],
//   ),),
//     ElevatedButton(
//       style: ElevatedButton.styleFrom(primary: Colors.transparent,elevation: 50),
//       onPressed: (){
//         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OpenWhatsapp0()));
//       }, child: Column(
//       children: [
//         SizedBox(height: 5,),
//         Container(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 35),
//                 child: Center(child: Text('Dr. Qamar Ali',style: TextStyle(color: Colors.white,fontSize: 30),)),
//               ),
//             ],
//           ),
//
//           height: 100,
//           width: 330,
//           decoration: BoxDecoration(
//               color: Colors.brown,
//               borderRadius: BorderRadius.circular(10)
//
//           ),
//         ),
//         SizedBox(height: 10,),
//
//       ],
//     ),),
//     ElevatedButton(
//       style: ElevatedButton.styleFrom(primary: Colors.transparent,elevation: 50),
//       onPressed: (){
//         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OpenWhatsapp0()));
//       }, child: Column(
//       children: [
//         SizedBox(height: 5,),
//         Container(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 35),
//                 child: Center(child: Text('Dr. Qamar Ali',style: TextStyle(color: Colors.white,fontSize: 30),)),
//               ),
//             ],
//           ),
//
//           height: 100,
//           width: 330,
//           decoration: BoxDecoration(
//               color: Colors.brown,
//               borderRadius: BorderRadius.circular(10)
//
//           ),
//         ),
//         SizedBox(height: 10,),
//
//       ],
//     ),),
//     ElevatedButton(
//       style: ElevatedButton.styleFrom(primary: Colors.transparent,elevation: 50),
//       onPressed: (){
//         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OpenWhatsapp0()));
//       }, child: Column(
//       children: [
//         SizedBox(height: 5,),
//         Container(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 35),
//                 child: Center(child: Text('Dr. Qamar Ali',style: TextStyle(color: Colors.white,fontSize: 30),)),
//               ),
//             ],
//           ),
//
//           height: 100,
//           width: 330,
//           decoration: BoxDecoration(
//               color: Colors.brown,
//               borderRadius: BorderRadius.circular(10)
//
//           ),
//         ),
//         SizedBox(height: 10,),
//
//       ],
//     ),),
//     ElevatedButton(
//       style: ElevatedButton.styleFrom(primary: Colors.transparent,elevation: 50),
//       onPressed: (){
//         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OpenWhatsapp0()));
//       }, child: Column(
//       children: [
//         SizedBox(height: 5,),
//         Container(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 35),
//                 child: Center(child: Text('Dr. Qamar Ali',style: TextStyle(color: Colors.white,fontSize: 30),)),
//               ),
//             ],
//           ),
//
//           height: 100,
//           width: 330,
//           decoration: BoxDecoration(
//               color: Colors.brown,
//               borderRadius: BorderRadius.circular(10)
//
//           ),
//         ),
//         SizedBox(height: 10,),
//
//       ],
//     ),),
//     ElevatedButton(
//       style: ElevatedButton.styleFrom(primary: Colors.transparent,elevation: 50),
//       onPressed: (){
//         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OpenWhatsapp0()));
//       }, child: Column(
//       children: [
//         SizedBox(height: 5,),
//         Container(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 35),
//                 child: Center(child: Text('Dr. Qamar Ali',style: TextStyle(color: Colors.white,fontSize: 30),)),
//               ),
//             ],
//           ),
//
//           height: 100,
//           width: 330,
//           decoration: BoxDecoration(
//               color: Colors.brown,
//               borderRadius: BorderRadius.circular(10)
//
//           ),
//         ),
//         SizedBox(height: 10,),
//
//       ],
//     ),),
//     ElevatedButton(
//       style: ElevatedButton.styleFrom(primary: Colors.transparent,elevation: 50),
//       onPressed: (){
//         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OpenWhatsapp0()));
//       }, child: Column(
//       children: [
//         SizedBox(height: 5,),
//         Container(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 35),
//                 child: Center(child: Text('Dr. Qamar Ali',style: TextStyle(color: Colors.white,fontSize: 30),)),
//               ),
//             ],
//           ),
//
//           height: 100,
//           width: 330,
//           decoration: BoxDecoration(
//               color: Colors.brown,
//               borderRadius: BorderRadius.circular(10)
//
//           ),
//         ),
//         SizedBox(height: 10,),
//
//       ],
//     ),),
//     ElevatedButton(
//       style: ElevatedButton.styleFrom(primary: Colors.transparent,elevation: 50),
//       onPressed: (){
//         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OpenWhatsapp0()));
//       }, child: Column(
//       children: [
//         SizedBox(height: 5,),
//         Container(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 35),
//                 child: Center(child: Text('Dr. Qamar Ali',style: TextStyle(color: Colors.white,fontSize: 30),)),
//               ),
//             ],
//           ),
//
//           height: 100,
//           width: 330,
//           decoration: BoxDecoration(
//               color: Colors.brown,
//               borderRadius: BorderRadius.circular(10)
//
//           ),
//         ),
//         SizedBox(height: 10,),
//
//       ],
//     ),),
//     ElevatedButton(
//       style: ElevatedButton.styleFrom(primary: Colors.transparent,elevation: 50),
//       onPressed: (){
//         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OpenWhatsapp0()));
//       }, child: Column(
//       children: [
//         SizedBox(height: 5,),
//         Container(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 35),
//                 child: Center(child: Text('Dr. Qamar Ali',style: TextStyle(color: Colors.white,fontSize: 30),)),
//               ),
//             ],
//           ),
//
//           height: 100,
//           width: 330,
//           decoration: BoxDecoration(
//               color: Colors.brown,
//               borderRadius: BorderRadius.circular(10)
//
//           ),
//         ),
//         SizedBox(height: 10,),
//
//       ],
//     ),),
//     ElevatedButton(
//       style: ElevatedButton.styleFrom(primary: Colors.transparent,elevation: 50),
//       onPressed: (){
//         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OpenWhatsapp0()));
//       }, child: Column(
//       children: [
//         SizedBox(height: 5,),
//         Container(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 35),
//                 child: Center(child: Text('Dr. Qamar Ali',style: TextStyle(color: Colors.white,fontSize: 30),)),
//               ),
//             ],
//           ),
//
//           height: 100,
//           width: 330,
//           decoration: BoxDecoration(
//               color: Colors.brown,
//               borderRadius: BorderRadius.circular(10)
//
//           ),
//         ),
//         SizedBox(height: 10,),
//
//       ],
//     ),),
//
//
//
//
//
//     // InkWell(
//     //   onTap: openwhatsapp0,
//     //   child: Column(
//     //     children: [
//     //       SizedBox(height: 5,),
//     //       Container(
//     //         child: Column(
//     //           children: [
//     //             Padding(
//     //               padding: const EdgeInsets.only(top:10,),
//     //               child: Text('Dr. Qamar Ali',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
//     //             ), SizedBox(height: 10,),
//     //             Text('Cardiac Specialist',style: TextStyle(color: Colors.white)),
//     //             SizedBox(height: 10,),
//     //             Text('Click to Start A Consultation',style: TextStyle(color: Colors.white)),
//     //           ],
//     //         ),
//     //
//     //         height: 100,
//     //         width: 330,
//     //         decoration: BoxDecoration(
//     //             color: Colors.brown,
//     //             borderRadius: BorderRadius.circular(10)
//     //
//     //         ),
//     //       ),
//     //       SizedBox(height: 10,),
//     //
//     //     ],
//     //   ),
//     // ),
//     // InkWell(
//     //   onTap: openwhatsapp1,
//     //   child: Column(
//     //     children: [
//     //       SizedBox(height: 5,),
//     //       Container(
//     //         child: Column(
//     //           children: [
//     //             Padding(
//     //               padding: const EdgeInsets.only(top:10,),
//     //               child: Text('Dr. Ali Raza',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
//     //             ), SizedBox(height: 10,),
//     //             Text('Skin Specialist',style: TextStyle(color: Colors.white)),
//     //             SizedBox(height: 10,),
//     //             Text('Click to Start A Consultation',style: TextStyle(color: Colors.white)),
//     //           ],
//     //         ),
//     //
//     //         height: 100,
//     //         width: 330,
//     //         decoration: BoxDecoration(
//     //             color: Colors.brown,
//     //             borderRadius: BorderRadius.circular(10)
//     //
//     //         ),
//     //       ),
//     //       SizedBox(height: 10,),
//     //
//     //     ],
//     //   ),
//     // ),
//     // InkWell(
//     //   onTap: openwhatsapp2,
//     //   child: Column(
//     //     children: [
//     //       SizedBox(height: 5,),
//     //       Container(
//     //         child: Column(
//     //           children: [
//     //             Padding(
//     //               padding: const EdgeInsets.only(top:10,),
//     //               child: Text('Dr. Shehzad Qamar',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
//     //             ), SizedBox(height: 10,),
//     //             Text('liver Specialist',style: TextStyle(color: Colors.white)),
//     //             SizedBox(height: 10,),
//     //             Text('Click to Start A Consultation',style: TextStyle(color: Colors.white)),
//     //           ],
//     //         ),
//     //
//     //         height: 100,
//     //         width: 330,
//     //         decoration: BoxDecoration(
//     //             color: Colors.brown,
//     //             borderRadius: BorderRadius.circular(10)
//     //
//     //         ),
//     //       ),
//     //       SizedBox(height: 10,),
//     //
//     //     ],
//     //   ),
//     // ),
//     // InkWell(
//     //   onTap: openwhatsapp3,
//     //   child: Column(
//     //     children: [
//     //       SizedBox(height: 5,),
//     //       Container(
//     //         child: Column(
//     //           children: [
//     //             Padding(
//     //               padding: const EdgeInsets.only(top:10,),
//     //               child: Text('Dr. Rashid Ali',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
//     //             ), SizedBox(height: 10,),
//     //             Text('Dental Specialist',style: TextStyle(color: Colors.white)),
//     //             SizedBox(height: 10,),
//     //             Text('Click to Start A Consultation',style: TextStyle(color: Colors.white)),
//     //           ],
//     //         ),
//     //
//     //         height: 100,
//     //         width: 330,
//     //         decoration: BoxDecoration(
//     //             color: Colors.brown,
//     //             borderRadius: BorderRadius.circular(10)
//     //
//     //         ),
//     //       ),
//     //       SizedBox(height: 10,),
//     //
//     //     ],
//     //   ),
//     // ),
//     // InkWell(
//     //   onTap: openwhatsapp4,
//     //   child: Column(
//     //     children: [
//     //       SizedBox(height: 5,),
//     //       Container(
//     //         child: Column(
//     //           children: [
//     //             Padding(
//     //               padding: const EdgeInsets.only(top:10,),
//     //               child: Text('Dr. Zuhaib Rana',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
//     //             ), SizedBox(height: 10,),
//     //             Text('kindney Specialist',style: TextStyle(color: Colors.white)),
//     //             SizedBox(height: 10,),
//     //             Text('Click to Start A Consultation',style: TextStyle(color: Colors.white)),
//     //           ],
//     //         ),
//     //
//     //         height: 100,
//     //         width: 330,
//     //         decoration: BoxDecoration(
//     //             color: Colors.brown,
//     //             borderRadius: BorderRadius.circular(10)
//     //
//     //         ),
//     //       ),
//     //       SizedBox(height: 10,),
//     //
//     //     ],
//     //   ),
//     // ),
//     // InkWell(
//     //   onTap: openwhatsapp5,
//     //   child: Column(
//     //     children: [
//     //       SizedBox(height: 5,),
//     //       Container(
//     //         child: Column(
//     //           children: [
//     //             Padding(
//     //               padding: const EdgeInsets.only(top:10,),
//     //               child: Text('Dr. Ileyas Mukhtyaar',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
//     //             ), SizedBox(height: 10,),
//     //             Text('Lungs Specialist',style: TextStyle(color: Colors.white)),
//     //             SizedBox(height: 10,),
//     //             Text('Click to Start A Consultation',style: TextStyle(color: Colors.white)),
//     //           ],
//     //         ),
//     //
//     //         height: 100,
//     //         width: 330,
//     //         decoration: BoxDecoration(
//     //             color: Colors.brown,
//     //             borderRadius: BorderRadius.circular(10)
//     //
//     //         ),
//     //       ),
//     //       SizedBox(height: 10,),
//     //
//     //     ],
//     //   ),
//     // ),
//     // InkWell(
//     //   onTap: openwhatsapp6,
//     //   child: Column(
//     //     children: [
//     //       SizedBox(height: 5,),
//     //       Container(
//     //         child: Column(
//     //           children: [
//     //             Padding(
//     //               padding: const EdgeInsets.only(top:10,),
//     //               child: Text('Dr. Azeem Sarwar',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
//     //             ), SizedBox(height: 10,),
//     //             Text('H.I.V Specialist',style: TextStyle(color: Colors.white)),
//     //             SizedBox(height: 10,),
//     //             Text('Click to Start A Consultation',style: TextStyle(color: Colors.white)),
//     //           ],
//     //         ),
//     //
//     //         height: 100,
//     //         width: 330,
//     //         decoration: BoxDecoration(
//     //             color: Colors.brown,
//     //             borderRadius: BorderRadius.circular(10)
//     //
//     //         ),
//     //       ),
//     //       SizedBox(height: 10,),
//     //
//     //     ],
//     //   ),
//     // ),
//     // InkWell(
//     //   onTap: openwhatsapp7,
//     //   child: Column(
//     //     children: [
//     //       SizedBox(height: 5,),
//     //       Container(
//     //         child: Column(
//     //           children: [
//     //             Padding(
//     //               padding: const EdgeInsets.only(top:10,),
//     //               child: Text('Dr. Umair ch',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
//     //             ), SizedBox(height: 10,),
//     //             Text('Huls Specialist',style: TextStyle(color: Colors.white)),
//     //             SizedBox(height: 10,),
//     //             Text('Click to Start A Consultation',style: TextStyle(color: Colors.white)),
//     //           ],
//     //         ),
//     //
//     //         height: 100,
//     //         width: 330,
//     //         decoration: BoxDecoration(
//     //             color: Colors.brown,
//     //             borderRadius: BorderRadius.circular(10)
//     //
//     //         ),
//     //       ),
//     //       SizedBox(height: 10,),
//     //
//     //     ],
//     //   ),
//     // ),
//     // InkWell(
//     //   onTap: openwhatsapp8,
//     //   child: Column(
//     //     children: [
//     //       SizedBox(height: 5,),
//     //       Container(
//     //         child: Column(
//     //           children: [
//     //             Padding(
//     //               padding: const EdgeInsets.only(top:10,),
//     //               child: Text('Dr. Haseeb Mehmood',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
//     //             ), SizedBox(height: 10,),
//     //             Text('Cancer Specialist',style: TextStyle(color: Colors.white)),
//     //             SizedBox(height: 10,),
//     //             Text('Click to Start A Consultation',style: TextStyle(color: Colors.white)),
//     //           ],
//     //         ),
//     //
//     //         height: 100,
//     //         width: 330,
//     //         decoration: BoxDecoration(
//     //             color: Colors.brown,
//     //             borderRadius: BorderRadius.circular(10)
//     //
//     //         ),
//     //       ),
//     //       SizedBox(height: 10,),
//     //
//     //     ],
//     //   ),
//     // ),
//     // InkWell(
//     //   onTap: openwhatsapp9,
//     //   child: Column(
//     //     children: [
//     //       SizedBox(height: 5,),
//     //       Container(
//     //         child: Column(
//     //           children: [
//     //             Padding(
//     //               padding: const EdgeInsets.only(top:10,),
//     //               child: Text('Dr. Aqib tahir',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
//     //             ), SizedBox(height: 10,),
//     //             Text('Eye Specialist',style: TextStyle(color: Colors.white)),
//     //             SizedBox(height: 10,),
//     //             Text('Click to Start A Consultation',style: TextStyle(color: Colors.white)),
//     //           ],
//     //         ),
//     //
//     //         height: 100,
//     //         width: 330,
//     //         decoration: BoxDecoration(
//     //             color: Colors.brown,
//     //             borderRadius: BorderRadius.circular(10)
//     //
//     //         ),
//     //       ),
//     //       SizedBox(height: 10,),
//     //
//     //     ],
//     //   ),
//     // ),
//
//   ],
// );
