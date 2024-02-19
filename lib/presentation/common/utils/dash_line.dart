import 'package:flutter/material.dart';

class MySeparator extends StatelessWidget {
  final double height;
  final double width;
  final bool isRow;
  final Color color;

  const MySeparator({
    super.key,
    required this.color,
    required this.width,
    required this.height,
    required this.isRow,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: isRow
          ? Row(
              children: List.generate(
                  150 ~/ 10,
                  (index) => Expanded(
                        child: Container(
                          color: index % 2 == 0 ? Colors.transparent : color,
                          height: 2,
                        ),
                      )),
            )
          : Column(
              children: List.generate(
                  150 ~/ 10,
                  (index) => Expanded(
                        child: Container(
                          color: index % 2 == 0 ? Colors.transparent : color,
                          height: 2,
                        ),
                      )),
            ),
    );
  }
}
