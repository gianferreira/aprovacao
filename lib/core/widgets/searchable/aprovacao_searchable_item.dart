import 'package:flutter/material.dart';

class AprovacaoSearchableItem extends StatelessWidget {
  const AprovacaoSearchableItem({
    Key? key,
    required this.item,
    required this.selectedItemController,
  }) : super(key: key);

  final String item;
  final ValueNotifier<String> selectedItemController;

  @override
  Widget build(BuildContext context) {
    final isSelected = item == selectedItemController.value;

    return InkWell(
      onTap: () {
        if(isSelected) {
          selectedItemController.value = '';
        } else {
          selectedItemController.value = item;
        }
      },
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24.0,
                  ),
                  child: Text(
                    item,
                    style: isSelected
                      ? TextStyle(
                          fontFamily: 'MyriadProRegular',
                          height: 1.2,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF4F4F4F),
                        )
                      : TextStyle(
                          fontFamily: 'MyriadProRegular',
                          height: 1.2,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8F8F8F),
                        ),
                  ),
                ),
              ),
              Radio<String>(
                value: item,
                groupValue: selectedItemController.value,
                onChanged: (String? value) {
                  selectedItemController.value = value ?? '';
                },
                visualDensity: VisualDensity.compact,
                fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected))
                      return Color(0xFF02CEFD);
                    return Color(0xFF5F5F5F);
                  },
                ),
              ),
            ],
          ),
          Divider(
            height: 1.0,
            thickness: 1.0,
            color: Color(0xFFE7E7E7),
          ),
        ],
      ),
    );
  }
}
