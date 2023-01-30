import 'package:admin_panel/constants/constants.dart';
import 'package:admin_panel/constants/promotion_firestore_db.dart';
import 'package:admin_panel/controller/promotion_controller.dart';
import 'package:admin_panel/models/promotion_model.dart';
import 'package:admin_panel/widgets/data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Promotion extends StatefulWidget {
  Promotion({super.key});

  @override
  State<Promotion> createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {
  TextEditingController labelController = TextEditingController();

  TextEditingController percentageController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController codeController = TextEditingController();

  void showPromotionDetails(PromotionModel model) {
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
                    "Label: ${model.promotionLabel}",
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Percentage: ${model.promotionPercentage}%",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Description: ${model.promotionDescription}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Code: #${model.promotionCode}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
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
                          PromotionFirestoreDb.deletePromotion(
                              model.promotionId!);
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
              "Promotions",
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
                                          "New Vendor",
                                          style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextField(
                                          controller: labelController,
                                          decoration: const InputDecoration(
                                              hintText: "Promotion label"),
                                        ),
                                        TextField(
                                          controller: percentageController,
                                          decoration: const InputDecoration(
                                              hintText: "Promotion percentage"),
                                        ),
                                        TextField(
                                          controller: descriptionController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Promotion description"),
                                        ),
                                        TextField(
                                          controller: codeController,
                                          decoration: const InputDecoration(
                                              hintText: "Code"),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              child: ElevatedButton(
                                                  onPressed: () async {
                                                    final promotionModel =
                                                        PromotionModel(
                                                      promotionLabel:
                                                          labelController.text,
                                                      promotionPercentage:
                                                          percentageController
                                                              .text,
                                                      promotionDescription:
                                                          descriptionController
                                                              .text,
                                                      promotionCode:
                                                          codeController.text,
                                                    );

                                                    await PromotionFirestoreDb
                                                        .addPromotion(
                                                            promotionModel);

                                                    labelController.clear();
                                                    percentageController
                                                        .clear();
                                                    descriptionController
                                                        .clear();
                                                    codeController.clear();
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
                      child: const Text("Create promotion")),
                ),
                const Spacer(),
                Container(
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Search"),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: DataWidget(
                  data1: "Label",
                  data2: "Percentage",
                  data3: "Description",
                  data4: "Code"),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 500,
              color: Colors.white,
              child: GetX<PromotionController>(
                  init: Get.put(PromotionController()),
                  builder: (PromotionController promotionController) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: promotionController.promotion.length,
                      itemBuilder: (context, index) {
                        final promotionModel0 =
                            promotionController.promotion[index];
                        return Material(
                          type: MaterialType.transparency,
                          child: ListTile(
                            hoverColor: Colors.amber,
                            onTap: () {
                              showPromotionDetails(promotionModel0);
                            },
                            title: DataWidget(
                              data1: promotionModel0.promotionLabel,
                              data2: promotionModel0.promotionPercentage,
                              data3: promotionModel0.promotionDescription,
                              data4: promotionModel0.promotionCode,
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
