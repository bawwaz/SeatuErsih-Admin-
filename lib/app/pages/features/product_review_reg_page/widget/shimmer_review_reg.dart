import 'package:flutter/material.dart';

class ShimmerReviewReg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade400,
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 20,
                  color: Colors.grey.shade400,
                ),
                SizedBox(height: 4),
                Container(
                  width: 80,
                  height: 16,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Icon(Icons.star, color: Colors.grey.shade400, size: 25),
                SizedBox(width: 4),
                Container(
                  width: 30,
                  height: 20,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
        Divider(color: Colors.grey.shade400),
        SizedBox(height: 8),
        Container(
          width: 100,
          height: 20,
          color: Colors.grey.shade400,
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 60,
                color: Colors.grey.shade400,
              ),
            ),
            SizedBox(width: 8),
            Container(
              width: 40,
              height: 40,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ],
    );
  }
}
