import 'package:book/Features/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:book/Features/search/presentation/views/widgets/animation_box.dart';
import 'package:book/Features/search/presentation/views/widgets/cutom_text_form_field.dart';
import 'package:book/Features/search/presentation/views/widgets/loading_search_list_view.dart';
import 'package:book/Features/search/presentation/views/widgets/search_list_view.dart';
import 'package:book/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 10, right: 16),
            child: CustomTextFormField(
              onFieldSubmitted: (category) {
                BlocProvider.of<SearchCubit>(context)
                    .fetchSearchedBooks(category: category);
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccess) {
                  return SearchListView(
                    length: state.books.length,
                    books: state.books,
                  );
                } else if (state is SearchLoading) {
                  return const LoadingSearchListView();
                } else if (state is SearchFailure) {
                  var height = MediaQuery.of(context).size.height;
                  return Padding(
                    padding: EdgeInsets.only(top: (height - 400) / 2),
                    child: CustomErrorWidget(
                      errText: state.errMessage,
                    ),
                  );
                } else {
                  return const AnimationBox();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
