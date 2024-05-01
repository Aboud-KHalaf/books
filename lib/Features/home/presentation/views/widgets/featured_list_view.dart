import 'package:book/Features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:book/Features/home/presentation/views/widgets/featured_list_view_item.dart';
import 'package:book/Features/home/presentation/views/widgets/featured_shimmer_list_viewI_iem.dart';
import 'package:book/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .29,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.kBookDetailsView,
                        extra: state.books[index],
                      );
                    },
                    child: FeaturedListViewItem(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              '',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return Container();
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .29,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FeaturedShimmerListViewItem(),
                );
              },
            ),
          );
        }
      },
    );
  }
}
