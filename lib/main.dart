import 'package:book/Features/home/data/repos/home_repo_impl.dart';
import 'package:book/Features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:book/Features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:book/Features/search/data/repos/search_repo_impl.dart';
import 'package:book/Features/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:book/constant.dart';
import 'package:book/core/services/api_service.dart';
import 'package:book/core/utils/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Book());
}

class Book extends StatelessWidget {
  const Book({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(HomeRepoImpl(ApiService(Dio())))
                ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(HomeRepoImpl(ApiService(Dio())))
            ..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(SearchRepoImpl(ApiService(Dio()))),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: KPrimaryColor,
          appBarTheme: const AppBarTheme(
            color: KPrimaryColor,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
