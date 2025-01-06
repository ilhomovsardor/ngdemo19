
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/main_controller.dart';
import '../views/item_of_random_user.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    Get.find<MainController>().initScrollListener();
    Get.find<MainController>().loadRandomUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Users - GetX(4)"),
      ),
      body: Obx(() => Stack(
        children: [
          ListView.builder(
            controller: Get.find<MainController>().scrollController,
            itemCount: Get.find<MainController>().userList.length,
            itemBuilder: (ctx, index) {
              return itemOfRandomUser(
                  Get.find<MainController>().userList[index], index);
            },
          ),
          Get.find<MainController>().isLoading.value
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : const SizedBox.shrink(),
        ],
      )),
    );
  }
}
