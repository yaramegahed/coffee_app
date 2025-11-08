import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonScreen extends StatelessWidget {
  const SkeletonScreen({super.key});

  Widget _buildShimmer({double height = 20, double width = double.infinity, BorderRadius? radius}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: radius ?? BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          _buildShimmer(height: 180, width: double.infinity, radius: BorderRadius.circular(12)),
          const SizedBox(height: 16),
          // Small text line
          _buildShimmer(width: 150, height: 20),
          const SizedBox(height: 8),
          _buildShimmer(width: 200, height: 20),
          const SizedBox(height: 16),
          // Horizontal list of images
          SizedBox(
            height: 220,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (_, __) => _buildShimmer(height: 220, width: 140, radius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 16),
          // Another section of small rectangles (like grid)
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(4, (index) => _buildShimmer(height: 120, width: (MediaQuery.of(context).size.width - 52) / 2, radius: BorderRadius.circular(12))),
          ),
        ],
      ),
    );
  }
}
