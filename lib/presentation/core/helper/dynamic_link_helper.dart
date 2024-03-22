import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';

import 'package:package_info_plus/package_info_plus.dart';

class DynamicLinksService {
  static Future<String> createDynamicLink({
    String title = '',
    String description = '',
    String imageURL = '',
    required String productId,
  }) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String uriPrefix = "https://iroid.page.link";

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: uriPrefix,
      link: Uri.tryParse('https://www.google.com/?productId=$productId')!,
      androidParameters: AndroidParameters(
        packageName: packageInfo.packageName,
        minimumVersion: 125,
      ),
      iosParameters: IOSParameters(
        bundleId: packageInfo.packageName,
        minimumVersion: packageInfo.version,
        appStoreId: '6478269568',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: title,
        description: description,
        imageUrl: Uri.tryParse(imageURL),
      ),
    );

    // final Uri dynamicUrl = await parameters.buildUrl();
    final ShortDynamicLink shortDynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(parameters);
    final Uri shortUrl = shortDynamicLink.shortUrl;
    return shortUrl.toString();
  }

  static void initDynamicLinks(BuildContext context) async {
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    if (data != null) {
      _handleDynamicLink(data, context);
    }
    FirebaseDynamicLinks.instance.onLink.listen((event) {
      _handleDynamicLink(event, context);
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
  }

  static _handleDynamicLink(
      PendingDynamicLinkData data, BuildContext context) async {
    final Uri deepLink = data.link;

    log('deepLink.query : ${deepLink.queryParameters['productId']}');
    if (deepLink.queryParameters['productId'] != null) {
      context.router.push(
        PageRouteInfo(
          ProductDetailsView.name,
          args: ProductDetailsViewArgs(
            productId: deepLink.queryParameters['productId'] ?? '',
          ),
        ),
      );
    }
  }
}
