import 'package:flutter/material.dart';
import 'package:seatu_ersih_admin/widget/Homepage/HomepageBody.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF7EC1EB),
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image(image: AssetImage('assets/img/icon.png')),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Stack(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xff545454),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0, left: 14),
                  child: Image(image: AssetImage('assets/img/user.png')),
                )
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              HomeBody(),
            ],
          ),
          Positioned(
            bottom: 110,
            right: 27,
            child: InkWell(
              onTap: () {
                print("123");
              },
              child: Image.asset(
                "assets/img/pen-edit.png",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
