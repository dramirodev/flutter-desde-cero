
import 'package:flutter/cupertino.dart';
import 'package:formularios/pages/keyboard_types.dart';
import 'package:formularios/pages/textfield_page.dart';
import 'package:formularios/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.testField: (_) => const TextFieldPage(),
    Routes.keyboardTypes: (_) => const KeyboardsTypesPages(),
  };
}