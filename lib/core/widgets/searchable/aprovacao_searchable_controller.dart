import 'package:aprovacao/core/widgets/searchable/aprovacao_searchable_state.dart';
import 'package:flutter/material.dart';

class AprovacaoSearchableController extends ValueNotifier<AprovacaoSearchableState> {
  AprovacaoSearchableController({
    required List<String> searchableItens
  }) : super(AprovacaoSearchableState(
    itens: searchableItens,
    filteredItens: searchableItens,
  ));

  void filterItens({
    required String searchText,
  }) {
    List<String> newFilteredItens = [];

    value.itens.forEach((item) {
      if (item.toLowerCase().contains(searchText)) {
        newFilteredItens.add(item);
      }
    });

    value = value.copyWith(
      filteredItens: newFilteredItens,
    );
  }

  void cleanFilter() {
    value = value.copyWith(
      filteredItens: value.itens,
    );
  }
}
