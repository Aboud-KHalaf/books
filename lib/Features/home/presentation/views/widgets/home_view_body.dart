import 'package:book/Features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:book/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:book/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:book/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeaturedListView(),
              Padding(
                padding: EdgeInsets.only(left: 16, top: 12),
                child: Text(
                  'New books',
                  style: Styles.textStyle20,
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: BestSellerListView(),
          ),
        )
      ],
    );
  }
}
