import 'package:flutter/widgets.dart';

import '../../../../../core/utils/styles.dart';
import 'similar_book_list_view.dart';

class SimilarBooksListViewSection extends StatelessWidget {
  const SimilarBooksListViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              "Books you may also like",
              style: Styles.textStyle16,
            ),
          ),
        ),
        SizedBox(height: 6),
        SimilarBooksListView(),
      ],
    );
  }
}
