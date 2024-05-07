import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';

import 'package:shimmer/shimmer.dart';

enum ContentLineType {
  twoLines,
  threeLines,
}

class ShimmerChatBubble extends StatelessWidget {
  const ShimmerChatBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: getSize(30),
          vertical: getSize(30),
        ),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 50,
        itemBuilder: (context, index) => ContentPlaceholder(
          lineType: ContentLineType.threeLines,
          index: index,
        ),
      ),
    );
  }
}

class ContentPlaceholder extends StatelessWidget {
  final ContentLineType lineType;
  final int index;
  const ContentPlaceholder({
    super.key,
    required this.lineType,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getSize(10)),
      child: Row(
        mainAxisAlignment:
            index % 2 == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          index % 2 == 0
              ? Container(
                  width: getSize(50),
                  height: getSize(50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(getSize(12)),
                    color: Colors.white,
                  ),
                )
              : Container(),
          SizedBox(width: getSize(12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: getSize(10),
                  color: Colors.white,
                  margin: EdgeInsets.only(bottom: getSize(8)),
                ),
                if (lineType == ContentLineType.threeLines)
                  Container(
                    width: getSize(180),
                    height: getSize(10),
                    color: Colors.white,
                    margin: EdgeInsets.only(bottom: getSize(8)),
                  ),
                Container(
                  width: getSize(100),
                  height: getSize(10),
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(width: getSize(12)),
          index % 2 != 0
              ? Container(
                  width: getSize(50),
                  height: getSize(50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(getSize(12)),
                    color: Colors.white,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
