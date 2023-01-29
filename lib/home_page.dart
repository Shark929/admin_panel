import 'package:admin_panel/controller/index_controller.dart';
import 'package:admin_panel/controller/label_controller.dart';
import 'package:admin_panel/controller/user_controller.dart';
import 'package:admin_panel/widgets/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  var label = "".obs();
  var index = 0.obs();
  final controller = Get.put(Controller());
  final indexController = Get.put(IndexController());
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          TabWidget(),
          Container(
            width: MediaQuery.of(context).size.width / 4 * 3,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width / 4 * 3,
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  color: const Color(0xff232855),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GetBuilder<Controller>(
                      builder: (_) => Text(
                        controller.label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 100,
                  color: const Color(0xff1E2142),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 250,
                              height: 250,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Container(
                              width: 400,
                              height: 250,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Subtitle 1",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffACACAC),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xffFFB422)),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Button 1",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      Container(
                                        width: 150,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xffFFB422)),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Button 2",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),

                      Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 10,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 6,
                              child: Text(
                                "Label 1",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 6,
                              child: Text(
                                "Label 4",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 6,
                              child: Text(
                                "Label 2",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 6,
                              child: Text(
                                "Label 3",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //scrollview

                      Expanded(
                        child: SizedBox(
                          height: 300,
                          child: ListView.builder(
                              // physics: NeverScrollableScrollPhysics(),

                              itemCount: 10,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                // final data = userController.wallet[index];

                                return GetBuilder<IndexController>(
                                    builder: (_) => InkWell(
                                          onTap: () {
                                            indexController.getIndex(index);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                              top: 10,
                                              bottom: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color:
                                                  indexController.index == index
                                                      ? const Color(0xffFFB422)
                                                      : const Color(0xff3A4073),
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 80,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            6,
                                                    child: Text(
                                                      "hello",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            6,
                                                    child: Text(
                                                      "threre",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            6,
                                                    child: Text(
                                                      "im",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            6,
                                                    child: Text(
                                                      "ivan",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ));
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
