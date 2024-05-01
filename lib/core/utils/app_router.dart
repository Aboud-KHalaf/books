import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:book/Features/home/data/repos/home_repo_impl.dart';
import 'package:book/Features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:book/Features/home/presentation/views/home_view.dart';
import 'package:book/Features/search/presentation/views/search_view.dart';
 import 'package:book/Features/splash/presentation/views/splash_view.dart';
import 'package:book/core/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/home/presentation/views/book_details_view.dart';

abstract class AppRouter {
  static const String kHomeView = "/homeView";
  static const String kBookDetailsView = "/detailsView";
  static const String kSearchView = "/searchView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider<SimilarBooksCubit>(
          create: (context) =>
              SimilarBooksCubit(HomeRepoImpl(ApiService(Dio()))),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
    ],
  );
}
