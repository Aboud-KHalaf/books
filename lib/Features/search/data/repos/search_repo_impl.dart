// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:book/Features/search/data/repos/search_repo.dart';
import 'package:book/core/errors/failures.dart';
import 'package:book/core/services/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  ApiService apiService;
  SearchRepoImpl(
    this.apiService,
  );

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks(
      {required String category}) async {
    String formattedCategory =
        Uri.encodeComponent(category.replaceAll(' ', '_'));
    try {
      var data = await apiService.getApi(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:$formattedCategory');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
