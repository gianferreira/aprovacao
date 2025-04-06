import 'package:aprovacao/core/widgets/searchable/aprovacao_searchable_controller.dart';
import 'package:aprovacao/core/widgets/searchable/aprovacao_searchable_state.dart';
import 'package:aprovacao/core/widgets/searchable/aprovacao_searchable_field.dart';
import 'package:aprovacao/core/widgets/searchable/aprovacao_searchable_item.dart';
import 'package:flutter/material.dart';

class AprovacaoSearchableView extends StatefulWidget {
  const AprovacaoSearchableView({
    Key? key,
    required this.searchableItens,
    required this.selectedItemController,
    required this.searchTextController,
    required this.listLabel,
    this.searchLabel = '',
  }) : super(key: key);

  final List<String> searchableItens;
  final ValueNotifier<String> selectedItemController;
  final TextEditingController searchTextController;
  final String listLabel;
  final String searchLabel;

  @override
  State<AprovacaoSearchableView> createState() => _AprovacaoSearchableViewState();
}

class _AprovacaoSearchableViewState extends State<AprovacaoSearchableView> {
  late AprovacaoSearchableController searchController;
  late ScrollController scrollController;

  @override
  void initState() {
    searchController = AprovacaoSearchableController(
      searchableItens: widget.searchableItens,
    );

    scrollController = ScrollController();

    super.initState();
  } 

  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Text(
            widget.listLabel,
            style: TextStyle(
              fontFamily: 'MyriadProRegular',
              height: 1.2,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: Color(0xFF545454),
            ),
          ),
        ),
        AprovacaoSearchableField(
          searchController: searchController,
          searchTextController: widget.searchTextController,
          searchLabel: widget.searchLabel,
        ),
        Expanded(
          child: ValueListenableBuilder<AprovacaoSearchableState>(
            valueListenable: searchController,
            builder: (context, searchState, child) {
              final filteredItens = searchState.filteredItens;

              if(filteredItens.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Nenhum resultado encontrado',
                        style: TextStyle(
                          fontFamily: 'MyriadProRegular',
                          height: 1.2,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8F8F8F),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return ValueListenableBuilder<String>(
                  valueListenable: widget.selectedItemController,
                  builder: (context, state, child) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            ...List.generate(
                              filteredItens.length,
                              (index) {
                                return AprovacaoSearchableItem(
                                  item: filteredItens[index],
                                  selectedItemController: widget.selectedItemController,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
