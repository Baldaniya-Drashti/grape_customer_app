import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonUrlLauncher extends StatelessWidget {
  const CommonUrlLauncher({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  static Future<void> launchAppUrl(String url) async {
    if (!await launchUrl(
      Uri.tryParse(url)!,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
