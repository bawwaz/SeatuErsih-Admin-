import 'package:flutter/material.dart';

class ShimmerPaymentHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(height: 50),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade400,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 10,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: 50,
                        height: 10,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 150,
                    height: 10,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            ),
            Container(
              width: 50,
              height: 10,
              color: Colors.grey.shade400,
            ),
          ],
        ),
        Divider(thickness: 1, color: Colors.black12),
      ],
    );
  }
}
