import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailShimmer extends StatelessWidget {
  const ProductDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey.shade50,
      baseColor: Colors.grey.shade300,
      child: Column(
        children: [
          Container(
            color: Colors.grey.shade300,
            width: MediaQuery.sizeOf(context).width,
            height: getSize(200),
          ),
          SizedBox(height: getSize(12)),
          dealDetails(),
          SizedBox(height: getSize(12)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getSize(18)),
            child: getDivider(),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: getSize(18)),
              children: [
                SizedBox(height: getSize(16)),
                location(),
                SizedBox(height: getSize(16)),
                getDivider(),
                SizedBox(height: getSize(16)),
                availableSlotsAndRequest(),
                SizedBox(height: getSize(16)),
                getDivider(),
                SizedBox(height: getSize(16)),
                description(context),
                SizedBox(height: getSize(16)),
                getDivider(),
                SizedBox(height: getSize(16)),
                location(),
                SizedBox(height: getSize(16)),
                getDivider(),
                SizedBox(height: getSize(16)),
                availableSlotsAndRequest(),
                SizedBox(height: getSize(16)),
                getDivider(),
                SizedBox(height: getSize(16)),
                location(),
                SizedBox(height: getSize(16)),
                getDivider(),
                SizedBox(height: getSize(16)),
                availableSlotsAndRequest(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row availableSlotsAndRequest() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: getSize(150),
                height: getSize(6),
                color: Colors.grey[400],
              ),
              SizedBox(height: getSize(6)),
              Container(
                width: getSize(100),
                height: getSize(6),
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
        SizedBox(
          width: getSize(60),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: getSize(150),
              height: getSize(6),
              color: Colors.grey[400],
            ),
            SizedBox(height: getSize(6)),
            Container(
              width: getSize(100),
              height: getSize(6),
              color: Colors.grey[400],
            ),
          ],
        ),
      ],
    );
  }

  Widget description(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: getSize(8),
          color: Colors.grey[400],
        ),
        SizedBox(height: getSize(7)),
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: getSize(8),
          color: Colors.grey[400],
        ),
        SizedBox(height: getSize(7)),
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: getSize(8),
          color: Colors.grey[400],
        ),
        SizedBox(height: getSize(7)),
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: getSize(8),
          color: Colors.grey[400],
        ),
        SizedBox(height: getSize(7)),
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: getSize(8),
          color: Colors.grey[400],
        ),
        SizedBox(height: getSize(7)),
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: getSize(8),
          color: Colors.grey[400],
        ),
        SizedBox(height: getSize(7)),
      ],
    );
  }

  Widget location() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: getSize(200),
          height: getSize(6),
          color: Colors.grey[400],
        ),
        SizedBox(height: getSize(7)),
        Container(
          width: getSize(250),
          height: getSize(6),
          color: Colors.grey[400],
        ),
      ],
    );
  }

  Divider getDivider() {
    return Divider(
      thickness: 1,
      height: 0,
      color: Colors.grey.shade200,
    );
  }

  Widget dealDetails() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getSize(18)),
      child: Row(
        children: [
          Container(
            height: getSize(46),
            width: getSize(46),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
          ),
          SizedBox(width: getSize(6)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: getSize(200),
                height: getSize(10),
                color: Colors.grey[400],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: getSize(130),
                height: getSize(10),
                color: Colors.grey[400],
              )
            ],
          ),
        ],
      ),
    );
  }
}
