import 'package:book/core/widgets/custom_shimmer_item.dart';
import 'package:flutter/material.dart';

class LoadingSearchListView extends StatelessWidget {
  const LoadingSearchListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(top: 10),
          child: CustomShimmerItem(),
        );
      },
    );
  }
}
