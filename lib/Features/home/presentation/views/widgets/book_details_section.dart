import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'featured_list_view_item.dart';
import 'rating_widget.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .23),
          child: FeaturedListViewItem(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(height: 24),
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 3),
        Text(
          bookModel.volumeInfo.authors![0],
          style: Styles.textStyle18.copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 6),
        const RatingWidget(),
      ],
    );
  }
}
