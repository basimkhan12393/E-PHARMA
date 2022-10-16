import 'package:flutter/material.dart';

class BackgroundImage2 extends StatelessWidget {
  const BackgroundImage2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [  Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/111.png'
                  ),
                  fit: BoxFit.cover
              )
          )
      ),
        Container(
          height: 550,

        ),



      ],

    );


  }
}