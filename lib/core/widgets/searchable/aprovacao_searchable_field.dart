import 'package:aprovacao/core/widgets/searchable/aprovacao_searchable_controller.dart';
import 'package:flutter/material.dart';

class AprovacaoSearchableField extends StatelessWidget {
  AprovacaoSearchableField({
    Key? key,
    required this.searchController,
    required this.searchTextController,
    required this.searchLabel,
    this.minTextLengthToSearch = 3,
  }) : super(key: key);

  final AprovacaoSearchableController searchController;
  final TextEditingController searchTextController;
  final String searchLabel;
  final int minTextLengthToSearch;

  @override
  Widget build(BuildContext context) {
    searchController.filterItens(
      searchText: searchTextController.text.toLowerCase(),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: searchTextController,
          builder: (context, searchText, child) {
            return Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 24.0,
                left: 16.0,
                right: 16.0,
              ),
              child: TextFormField(                              
                controller: searchTextController,
                style: TextStyle(
                  fontFamily: 'MyriadProRegular',
                  height: 1.2,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF4F4F4F),
                ),
                maxLength: 20,
                buildCounter: (BuildContext context, {
                  currentLength = 0,
                  maxLength = 0,
                  isFocused = false,
                }) => null,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  if(value.length >= minTextLengthToSearch) {
                    searchController.filterItens(
                      searchText: value.toLowerCase(),
                    );
                  } else {
                    searchController.cleanFilter();
                  }
                },
                cursorColor: Color(0xFF373737),
                cursorWidth: 1.0,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16.0),
                  filled: true,
                  fillColor: Color(0xFFEDEDED),
                  hintText: searchLabel,
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: searchText.text.isEmpty 
                      ? Color(0xFF5F5F5F)
                      : Color(0xFF373737),
                  ),
                  suffixIcon: searchText.text.isEmpty
                    ? null
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: IconButton(
                          onPressed: () {
                            searchController.cleanFilter();
                            searchTextController.clear();
                          }, 
                          icon: Icon(
                            Icons.close,
                            size: 20.0,
                            color: searchText.text.isEmpty 
                              ? Color(0xFFC7C7C7)
                              : Color(0xFF373737),
                          ),
                        ),
                      ),
                    hintStyle: TextStyle(
                      fontFamily: 'MyriadProRegular',
                      height: 1.2,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF8F8F8F),
                    ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
