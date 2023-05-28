import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_counter_app/controllers/controller.dart';

class MyHomePage extends GetView<MyController> {
  MyHomePage({super.key});

  @override
  final controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx Counter App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.green[500])),
                  onPressed: () {
                    controller.countIncrease();
                  },
                  child: const Icon(Icons.add),
                ),
                Obx(
                  (() => Text(
                        '${controller.count.value}',
                        style: const TextStyle(fontSize: 28),
                      )),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.red[500]),
                    ),
                    onPressed: () {
                      controller.count.value == 0
                          ? Get.snackbar(
                              'Warning', 'Counter can not be Negative',
                              leftBarIndicatorColor: Colors.amber,
                              snackPosition: SnackPosition.BOTTOM)
                          : controller.countDecrease();
                    },
                    child: const Icon(
                      Icons.horizontal_rule,
                      size: 28,
                    )),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: const ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(Size.fromWidth(320))),
                  onPressed: () {
                    controller.countReset();
                  },
                  child: const Text(
                    'Reset',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
