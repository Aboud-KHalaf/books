import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:book/Features/home/data/repos/home_repo.dart';
import 'package:book/core/errors/failures.dart';
import 'package:book/core/services/api_service.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;
  HomeRepoImpl(
    this.apiService,
  );
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.getApi(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=programming',
      );

      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          //  books.add(BookModel.fromJson(item));
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioError(e));
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.getApi(
        endPoint: 'volumes?Filtering=free-ebooks &q=computer science',
      );

      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          // books.add(BookModel.fromJson(item));
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioError(e));
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.getApi(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:$category');
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
