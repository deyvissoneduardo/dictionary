import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/platform_extensions.dart';
import './bottom_bar_controller.dart';

class BottomBarPage extends GetView<BottomBarController> {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.pages[controller.selectedIndex.value]),
      drawer: !context.mobile() || context.tablet()
          ? Drawer(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('Home'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Favoritos'),
                  ),
                ],
              ),
            )
          : const SizedBox(),
      bottomNavigationBar: !context.mobile() || !context.mobile()
          ? Obx(() {
              return BottomNavigationBar(
                onTap: (index) => controller.selectedIndex.value = index,
                currentIndex: controller.selectedIndex.value,
                elevation: 8,
                backgroundColor: Colors.grey[300],
                fixedColor: Colors.purple,
                iconSize: 25,
                mouseCursor: MouseCursor.defer,
                selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                showSelectedLabels: true,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: 'Home',
                    tooltip: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    activeIcon: Icon(Icons.favorite),
                    label: 'Favorite',
                    tooltip: 'Favorite',
                  ),
                ],
              );
            })
          : const SizedBox(),
    );
  }
}
