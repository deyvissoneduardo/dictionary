import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './favotire_controller.dart';

class FavotirePage extends GetView<FavotireController> {
  const FavotirePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FavotirePage'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              controller.colorPrimary.value!,
              controller.colorSecondary.value!,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
