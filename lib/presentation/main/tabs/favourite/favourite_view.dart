import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';

@RoutePage(name: 'FavouriteView')
class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseText(text: 'Favourite View'),
    );
  }
}
