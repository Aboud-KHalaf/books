import 'package:book/Features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:book/Features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:book/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:book/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> onRefresh() async {
      BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks();
      BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
      await Future.delayed(const Duration(seconds: 1));
    }

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: KSecondaryColor,
          onRefresh: onRefresh,
          child: const HomeViewBody(),
        ),
      ),
    );
  }
}
