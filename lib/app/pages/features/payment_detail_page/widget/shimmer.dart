import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  final double screenWidth;

  ShimmerLoading({required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 2,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: screenWidth * 0.1,
                          height: 24,
                          color: Colors.white,
                        ),
                        SizedBox(width: 15),
                        Container(
                          width: screenWidth * 0.3,
                          height: screenWidth * 0.06,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: screenWidth * 0.3,
                      height: 12,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.034,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 20,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 20,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.034,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 20,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 20,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
