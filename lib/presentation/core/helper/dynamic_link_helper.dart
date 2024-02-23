import 'dart:developer';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

import 'package:package_info_plus/package_info_plus.dart';

class DynamicLinksService {
  static Future<String> createDynamicLink({
    String title = '',
    String description = '',
    String imageURL = '',
  }) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String uriPrefix = "https://grapecustomer.page.link";

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: uriPrefix,
      link: Uri.tryParse('https://www.google.com/')!,
      androidParameters: AndroidParameters(
        packageName: packageInfo.packageName,
        minimumVersion: 125,
      ),
      iosParameters: IOSParameters(
        bundleId: packageInfo.packageName,
        minimumVersion: packageInfo.version,
        appStoreId: '',
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

  static void initDynamicLinks() async {
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    if (data != null) {
      _handleDynamicLink(data);
    }
    FirebaseDynamicLinks.instance.onLink.listen((event) {
      _handleDynamicLink(event);
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
  }

  static _handleDynamicLink(PendingDynamicLinkData data) async {
    final Uri deepLink = data.link;
    log(deepLink.path);
  }
}
