import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/ui/theme/theme_default.dart';
import 'app/modules/core/core_bindings.dart';
import 'app/routers/app_routers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dictionary App',
      enableLog: true,
      themeMode: ThemeMode.system,
      theme: ThemeDefault.themeDefualt,
      initialRoute: AppRouters.HOMEPAGE,
      getPages: AppRouters.pages,
      initialBinding: CoreBindings(),
    ),
  );
}
