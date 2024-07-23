import 'package:flutter/material.dart';

class Homebtm extends StatelessWidget {
  const Homebtm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 67,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Color(0xFF7EC1EB),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage('assets/img/home.png'),
            ),
            Image(
              image: AssetImage('assets/img/history.png'),
            ),
            Image(
              image: AssetImage('assets/img/dryer.png'),
            ),
          ],
        ),
      ),
    );
  }
}
