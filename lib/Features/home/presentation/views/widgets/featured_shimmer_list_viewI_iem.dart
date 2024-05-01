// ignore: file_names
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedShimmerListViewItem extends StatelessWidget {
  const FeaturedShimmerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          child: Container(
            height: 50,
            width: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
