import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:book/Features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:flutter/material.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
    required this.length,
    required this.books,
  });

  final int length;
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: BestSellerListViewItem(
            bookModel: books[index],
          ),
        );
      },
    );
  }
}
