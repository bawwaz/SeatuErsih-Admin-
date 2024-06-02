import 'package:flutter/material.dart';

class AddImage extends StatelessWidget {
  const AddImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 27.0, top: 10),
      child: GestureDetector(
        onTap: () {
          print("tes123");
        },
        child: Container(
          height: 111,
          width: 210,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 0.5,
                  spreadRadius: 0.5,
                )
              ]),
          child:
              Image.asset("assets/img/picture 1.png"),
        ),
      ),
    );
  }
}