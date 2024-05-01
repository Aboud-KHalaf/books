import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:book/constant.dart';
import 'package:book/core/helpers/functions.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/widgets/custom_button.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CustomButton(
            fontSize: 18,
            TextColor: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
            text: r"Free",
            backgroundColor: Colors.white,
          ),
        ),
        Expanded(
          child: CustomButton(
            onTap: () async {
              String previewLink = bookModel.volumeInfo.previewLink!;
              Uri uri = Uri.parse(bookModel.volumeInfo.previewLink!);
              if (previewLink == "no_link") {
                showMessage(context);
              } else {
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  // ignore: use_build_context_synchronously
                  showMessage(context);
                }
              }
            },
            fontSize: 16,
            TextColor: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
            text: "Preview Book",
            backgroundColor: KSecondaryColor,
          ),
        )
      ],
    );
  }
}
