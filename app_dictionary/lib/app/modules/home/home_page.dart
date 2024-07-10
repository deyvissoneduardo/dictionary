import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/ui/widgets/loading_widget.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const LoadingWidget()
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  itemCount: controller.wordsModel.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Card(
                          child: Center(
                            child: Text(
                              controller.wordsModel[index],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Obx(() {
                            return IconButton(
                              onPressed: () => controller.favoriteWord(index),
                              icon: Icon(
                                Icons.favorite_border,
                                color: controller.wordsFavorite
                                        .contains(controller.wordsModel[index])
                                    ? Colors.redAccent
                                    : Colors.grey,
                              ),
                            );
                          }),
                        ),
                      ],
                    );
                  },
                ),
              ),
      ),
    );
  }
}
