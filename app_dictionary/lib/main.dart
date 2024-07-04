import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/home/home_bindings.dart';
import 'app/routers/app_routers.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dictionary App',
      enableLog: true,
      themeMode: ThemeMode.system,
      initialRoute: AppRouters.HOMEPAGE,
      getPages: AppRouters.pages,
      initialBinding: HomeBindings(),
    ),
  );
}
