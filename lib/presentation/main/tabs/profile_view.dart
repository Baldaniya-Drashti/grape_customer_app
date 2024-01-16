import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';

@RoutePage(name: 'ProfileView')
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseText(text: 'Profile View'),
    );
  }
}
