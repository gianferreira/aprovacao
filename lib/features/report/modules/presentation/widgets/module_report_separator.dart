import 'package:aprovacao/features/modules/list/domain/entities/module_entity.dart';
import 'package:flutter/material.dart';

class ModuleReportSeparator extends StatelessWidget {
  const ModuleReportSeparator({
    Key? key,
    required this.itemModule,
    required this.currentModule,
  }) : super(key: key);

  final ModuleEntity itemModule;
  final ModuleEntity currentModule;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 14.0,
                width: 4.0,
                decoration: BoxDecoration(
                  color: itemModule.sequenceId < currentModule.sequenceId
                    ? Color(0xFF0075FF)
                    : Color(0xFFE3E3E3),
                ),
              ),
              Container(
                height: 14.0,
                width: 4.0,
                decoration: BoxDecoration(
                  color: itemModule.sequenceId < currentModule.sequenceId
                    ? Color(0xFF0075FF)
                    : Color(0xFFE3E3E3),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
