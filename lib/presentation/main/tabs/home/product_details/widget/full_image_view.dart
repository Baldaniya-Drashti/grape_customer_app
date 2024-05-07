import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:grape_customer_app/presentation/core/widgets/layout/layout.dart';

@RoutePage(name: 'FullImageView')
class FullImageView extends StatelessWidget {
  final String imageUrl;

  final ChewieController? chewieController;
  const FullImageView({
    super.key,
    required this.imageUrl,
    this.chewieController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ''),
      body: WillPopScope(
        onWillPop: () {
          Navigator.pop(context, true);
          return Future.value(true);
        },
        child: SafeArea(
          child: Center(
            child: imageUrl.contains('mp4')
                ? chewieController != null &&
                        chewieController!
                            .videoPlayerController.value.isInitialized
                    ? Chewie(controller: chewieController!)
                    : Center(
                        child: CircularProgressIndicator(),
                      )
                : CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) => Container(
                      color: Colors.grey.shade300,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
