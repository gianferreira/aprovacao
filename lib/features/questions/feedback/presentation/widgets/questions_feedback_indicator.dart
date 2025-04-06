import 'package:flutter/material.dart';

class QuestionsFeedbackIndicator extends StatelessWidget {
  const QuestionsFeedbackIndicator({
    Key? key,
    required this.profileLevel,
    required this.profileColor,
  }) : super(key: key);

  final int profileLevel;
  final Color profileColor;

  @override
  Widget build(BuildContext context) {
    final totalProfiles = 4;

    return SizedBox(
      height: 6.0,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: totalProfiles,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final painted = profileLevel >= index + 1;
          
          final first = index == 0;
          final last = index == totalProfiles - 1;

          return Container(
            width: 36.0,
            decoration: BoxDecoration(
              color: painted
                ? profileColor
                : Color(0xFFE7E7E7),
              borderRadius: BorderRadius.only(
                topLeft: first 
                  ? Radius.circular(6.0)
                  : Radius.zero,
                topRight: last 
                  ? Radius.circular(6.0)
                  : Radius.zero,
                bottomLeft:first 
                  ? Radius.circular(6.0)
                  : Radius.zero,
                bottomRight: last 
                  ? Radius.circular(6.0)
                  : Radius.zero,
              )
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 4.0);
        },
      ),
    );
  }
}
