// ignore_for_file: non_constant_identifier_names

import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import 'book_action.dart';
import 'book_details_section.dart';
import 'similar_book_list_view_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: BookDetailsSection(bookModel: bookModel),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: BookAction(
                  bookModel: bookModel,
                ),
              ),
              const Expanded(
                child: SizedBox(height: 40),
              ),
              const SimilarBooksListViewSection(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
