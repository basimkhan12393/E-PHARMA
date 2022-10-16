import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [  Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/bg.png'
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