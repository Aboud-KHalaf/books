import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:book/core/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import 'rating_widget.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        width: double.infinity - 100,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookModel.volumeInfo.title!,
                    style: Styles.textStyle20,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    bookModel.volumeInfo.authors![0],
                    style: Styles.textStyle18.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Free",
                        style: Styles.textStyle20,
                      ),
                      RatingWidget(),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
