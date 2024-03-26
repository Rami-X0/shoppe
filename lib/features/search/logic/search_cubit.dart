import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/features/search/data/models/search_request.dart';
import 'package:shoppe/features/search/data/search_repo/search_repo.dart';
import 'package:shoppe/features/search/logic/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SearchRepo _searchRepo;

  SearchCubit(this._searchRepo) : super(const SearchState.initial());

  void emitSearch() async {
    emit(const SearchState.loadingSearch());
    final response = await _searchRepo
        .search(SearchRequest(productName: searchController.text));
    response.whenOrNull(success: (productsResponse) {
      emit(SearchState.successSearch(productsResponse));
    });
  }

  void validateSearch(BuildContext context) {
    if (formKey.currentState!.validate()) {
      emitSearch();
    }
  }
}
