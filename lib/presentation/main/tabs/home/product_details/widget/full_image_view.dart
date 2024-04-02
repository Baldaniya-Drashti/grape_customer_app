import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grape_customer_app/presentation/core/widgets/layout/layout.dart';

@RoutePage(name: 'FullImageView')
class FullImageView extends StatelessWidget {
  final String imageUrl;
  const FullImageView({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ''),
      body: SafeArea(
        child: Center(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            //width: MediaQuery.of(context).size.width,
            placeholder: (context, url) => Container(
              color: Colors.grey.shade300,
            ),
          ),
        ),
      ),
    );
  }
}
