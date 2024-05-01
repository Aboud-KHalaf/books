// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:book/Features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  SearchRepo searchRepo;

  Future<void> fetchSearchedBooks({required String category}) async {
    emit(SearchLoading());

    var result = await searchRepo.fetchSearchBooks(category: category);
    result.fold(
      (failure) {
        emit(SearchFailure(errMessage: failure.errorMessage));
      },
      (books) {
        emit(
          SearchSuccess(books: books),
        );
      },
    );
  }
}
