import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/platform_extensions.dart';
import '../../core/ui/widgets/loading_widget.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  int _sizeLayout(BuildContext context) {
    return !context.mobile()
        ? 3
        : !context.tablet()
            ? 6
            : 10;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? Container(
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
                child: const LoadingWidget(),
              )
            : Container(
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
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: ElevatedButton(
                          onPressed: () {},
                          child: const Icon(Icons.search),
                        ),
                        hintText: 'Digite uma palavra',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: GridView.builder(
                        itemCount: controller.wordsModel.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: _sizeLayout(context),
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
                                child: Obx(
                                  () {
                                    return IconButton(
                                      onPressed: () =>
                                          controller.favoriteWord(index),
                                      icon: !controller.wordsFavorite.contains(
                                        controller.wordsModel[index],
                                      )
                                          ? const Icon(
                                              Icons.favorite_border,
                                              color: Colors.grey,
                                            )
                                          : const Icon(
                                              Icons.favorite,
                                              color: Colors.redAccent,
                                            ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
