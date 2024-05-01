import 'package:book/Features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:book/core/utils/app_router.dart';
import 'package:book/core/widgets/custom_error_widget.dart';
import 'package:book/core/widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'featured_list_view_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .2,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetailsView,
                          extra: state.books[index]);
                    },
                    child: FeaturedListViewItem(
                        imageUrl: state.books[index].volumeInfo.imageLinks
                                ?.thumbnail ??
                            ''),
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomErrorWidget(errText: state.errMessage),
          );
        } else {
          return const CustomProgressIndicator();
        }
      },
    );
  }
}
