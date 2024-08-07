import 'package:flutter/material.dart';

class ShimmerProductReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 3,
                offset: Offset(0, 0),
              ),
            ],
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 20,
                color: Colors.grey.shade400,
              ),
              SizedBox(height: 8),
              Container(
                width: 150,
                height: 20,
                color: Colors.grey.shade400,
              ),
              Divider(
                height: 24,
                thickness: 1,
                color: Colors.grey.shade400,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 20,
                    color: Colors.grey.shade400,
                  ),
                  Spacer(),
                  Container(
                    width: 40,
                    height: 40,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
