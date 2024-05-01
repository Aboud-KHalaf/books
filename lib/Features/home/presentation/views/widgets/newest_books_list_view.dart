import 'package:book/Features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:book/Features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:book/core/widgets/custom_error_widget.dart';
import 'package:book/core/widgets/custom_shimmer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: BestSellerListViewItem(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is NewestBooksFailure) {
          return Padding(
            padding: const EdgeInsets.only(right: 16, top: 100),
            child: Center(child: CustomErrorWidget(errText: state.errMessage)),
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(top: 10),
                child: CustomShimmerItem(),
              );
            },
          );
        }
      },
    );
  }
}
