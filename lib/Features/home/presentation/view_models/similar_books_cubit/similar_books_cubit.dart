// ignore_for_file: non_constant_identifier_names

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:book/Features/home/data/models/book_model/book_model.dart';

import '../../../data/repos/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchSimilarBooks({required String Category}) async {
    emit(SimilarBooksInitial());

    var result = await homeRepo.fetchSimilarBooks(category: Category);
    result.fold(
      (failure) => {
        emit(SimilarBooksFailure(errMessage: failure.errorMessage)),
      },
      (books) {
        emit(SimilarBookSuccess(books: books));
      },
    );
  }
}
