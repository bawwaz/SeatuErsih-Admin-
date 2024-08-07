import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCardOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: double.infinity,
        height: 205,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 3,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 16,
              color: Colors.grey.shade300,
            ),
            SizedBox(height: 8),
            Container(
              width: 200,
              height: 14,
              color: Colors.grey.shade300,
            ),
            SizedBox(height: 20),
            Container(
              width: 120,
              height: 16,
              color: Colors.grey.shade300,
            ),
            SizedBox(height: 8),
            Container(
              width: 200,
              height: 14,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }
}
