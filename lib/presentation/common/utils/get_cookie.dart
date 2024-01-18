import 'package:hive/hive.dart';
import 'package:grape_customer_app/infrastructure/core/hive_box_names.dart';

String? getUserToken() {
  return Hive.box(BoxNames.settingsBox).get(BoxKeys.userToken);
}

String? getRememberToken() {
  return Hive.box(BoxNames.settingsBox).get(BoxKeys.rememberToken);
}

bool? isUserShowIntro() {
  return Hive.box(BoxNames.settingsBox).get(BoxKeys.isUserShowIntro);
}
