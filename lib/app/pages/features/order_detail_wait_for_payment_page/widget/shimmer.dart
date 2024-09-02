import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  final double screenWidth;

  const ShimmerLoading({Key? key, required this.screenWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildShimmerBox(screenWidth * 0.2, 20), // Placeholder for title
        SizedBox(height: 10),
        _buildShimmerContainer(screenWidth), // Placeholder for Order section
        SizedBox(height: 20),
        _buildShimmerBox(
            screenWidth * 0.2, 20), // Placeholder for Contact title
        SizedBox(height: 10),
        _buildShimmerContainer(screenWidth), // Placeholder for Contact section
        SizedBox(height: 20),
        _buildShimmerBox(
            screenWidth * 0.2, 20), // Placeholder for Customer Item title
        SizedBox(height: 10),
        _buildShimmerContainer(
            screenWidth), // Placeholder for Customer Item section
        SizedBox(height: 10),
        _buildShimmerContainer(
            screenWidth), // Placeholder for another Customer Item section
      ],
    );
  }

  Widget _buildShimmerBox(double width, double height) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        color: Colors.grey[300],
      ),
    );
  }

  Widget _buildShimmerContainer(double width) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
  
}
