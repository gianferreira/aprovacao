class AprovacaoSearchableState {
  final List<String> itens;
  final List<String> filteredItens;

  AprovacaoSearchableState({
    required this.itens,
    required this.filteredItens,
  });

  AprovacaoSearchableState copyWith({
    List<String>? filteredItens,
  }) {
    return AprovacaoSearchableState(
      itens: this.itens,
      filteredItens: filteredItens ?? this.filteredItens,
    );
  }
}
