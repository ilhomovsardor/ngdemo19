
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/starter_controller.dart';
import '../views/item_of_random_user.dart';


class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  final _controller = Get.put(StarterController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.initScrollListener();
    _controller.loadRandomUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Users - GetX(2)"),
      ),
      body: Obx(() => Stack(
        children: [
          ListView.builder(
            controller: _controller.scrollController,
            itemCount: _controller.userList.length,
            itemBuilder: (ctx, index) {
              return itemOfRandomUser(_controller.userList[index], index);
            },
          ),
          _controller.isLoading.value
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : const SizedBox.shrink(),
        ],
      )),
    );
  }
}
