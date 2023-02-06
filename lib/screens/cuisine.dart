import 'package:admin_panel/constants/cuisine_firestore_db.dart';
import 'package:admin_panel/controller/cuisine_controller.dart';
import 'package:admin_panel/models/cuisine_model.dart';
import 'package:admin_panel/widgets/data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cuisine extends StatefulWidget {
  const Cuisine({super.key});

  @override
  State<Cuisine> createState() => _CuisineState();
}

class _CuisineState extends State<Cuisine> {
  TextEditingController cuisineController = TextEditingController();
  TextEditingController searchCuisineController = TextEditingController();
  void showPromotionDetails(CuisineModel model) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 100,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cuisine: ${model.cuisine}",
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.red),
                        ),
                        onPressed: () {
                          CuisineFirestoreDb.deleteCuisine(model.cuisineId!);
                          Navigator.pop(context);
                        },
                        child: const Text("Delete")),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 5 * 4,
      color: const Color.fromARGB(255, 255, 247, 222),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Cuisines",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 180,
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 50,
                                      vertical: 100,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text(
                                          "New Cuisine",
                                          style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextField(
                                          controller: cuisineController,
                                          decoration: const InputDecoration(
                                              hintText: "Cuisine name"),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              child: ElevatedButton(
                                                  onPressed: () async {
                                                    final cuisineModel =
                                                        CuisineModel(
                                                            cuisine:
                                                                cuisineController
                                                                    .text);

                                                    await CuisineFirestoreDb
                                                        .addCuisine(
                                                            cuisineModel);
                                                    cuisineController.clear();
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("Confirm")),
                                            ),
                                            SizedBox(
                                              width: 150,
                                              child: ElevatedButton(
                                                  style: const ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll<
                                                            Color>(Colors.red),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("Cancel")),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      child: const Text("Add Cuisine")),
                ),
                const Spacer(),
                Container(
                  width: 200,
                  // height: 30,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                      controller: searchCuisineController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        hintText: "Search cuisine",
                        border: InputBorder.none,
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child:
                  DataWidget(data1: "Cuisine", data2: "", data3: "", data4: ""),
            ),
            const SizedBox(
              height: 10,
            ),
            searchCuisineController.text.isNotEmpty
                ? Container(
                    height: 500,
                    color: Colors.white,
                    child: GetX<CuisineController>(
                        init: Get.put(CuisineController()),
                        builder: (CuisineController cuisineController) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: cuisineController.cuisine.length,
                            itemBuilder: (context, index) {
                              final location0 =
                                  cuisineController.cuisine[index];
                              if (searchCuisineController.text
                                  .contains(location0.cuisine.toLowerCase())) {
                                return Material(
                                  type: MaterialType.transparency,
                                  child: ListTile(
                                    hoverColor: Colors.amber,
                                    onTap: () {
                                      showPromotionDetails(location0);
                                    },
                                    title: DataWidget(
                                      data1: location0.cuisine,
                                      data2: '',
                                      data3: '',
                                      data4: '',
                                    ),
                                  ),
                                );
                              }
                              return const SizedBox();
                            },
                          );
                        }),
                  )
                : Container(
                    height: 500,
                    color: Colors.white,
                    child: GetX<CuisineController>(
                        init: Get.put(CuisineController()),
                        builder: (CuisineController cuisineController) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: cuisineController.cuisine.length,
                            itemBuilder: (context, index) {
                              final promotionModel0 =
                                  cuisineController.cuisine[index];
                              return Material(
                                type: MaterialType.transparency,
                                child: ListTile(
                                  hoverColor: Colors.amber,
                                  onTap: () {
                                    showPromotionDetails(promotionModel0);
                                  },
                                  title: DataWidget(
                                    data1: promotionModel0.cuisine,
                                    data2: '',
                                    data3: '',
                                    data4: '',
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }
}
