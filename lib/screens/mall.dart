import 'package:admin_panel/constants/location_firestore_db.dart';
import 'package:admin_panel/constants/mall_firestore_db.dart';
import 'package:admin_panel/constants/promotion_firestore_db.dart';
import 'package:admin_panel/controller/location_controller.dart';
import 'package:admin_panel/controller/mall_controller.dart';
import 'package:admin_panel/models/location_model.dart';
import 'package:admin_panel/models/mall_model.dart';
import 'package:admin_panel/widgets/data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mall extends StatefulWidget {
  const Mall({super.key});

  @override
  State<Mall> createState() => _MallState();
}

class _MallState extends State<Mall> {
  TextEditingController mallController = TextEditingController();
  TextEditingController searchMallController = TextEditingController();
  String dropdownLocation = "Bukit Bintang";

  void showPromotionDetails(MallModel model) {
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
                    "mall: ${model.mall}",
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
                          PromotionFirestoreDb.deletePromotion(model.mallId!);
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
              "Malls",
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
                                          "New Mall",
                                          style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Row(
                                            children: [
                                              const Text(
                                                "Location: ",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              GetX<LocationController>(
                                                init: Get.put(
                                                    LocationController()),
                                                builder: (LocationController
                                                    lcController) {
                                                  List<String> mylist = [];
                                                  for (int i = 0;
                                                      i <
                                                          lcController
                                                              .location.length;
                                                      i++) {
                                                    if (mylist.length <
                                                            lcController
                                                                .location
                                                                .length ||
                                                        mylist.isEmpty) {
                                                      mylist.add(lcController
                                                          .location[i]
                                                          .locationName);
                                                    }
                                                  }
                                                  return DropdownButton(
                                                    // Initial Value
                                                    value: dropdownLocation,

                                                    // Down Arrow Icon
                                                    icon: const Icon(Icons
                                                        .keyboard_arrow_down),

                                                    // Array list of items
                                                    items: mylist
                                                        .map((String items) {
                                                      return DropdownMenuItem(
                                                        value: items,
                                                        child: Text(items),
                                                      );
                                                    }).toList(),
                                                    // After selecting the desired option,it will
                                                    // change button value to selected value
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        dropdownLocation =
                                                            newValue!;
                                                      });
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        TextField(
                                          controller: mallController,
                                          decoration: const InputDecoration(
                                              hintText: "Mall name"),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              child: ElevatedButton(
                                                  onPressed: () async {
                                                    final mallModel = MallModel(
                                                        mall:
                                                            mallController.text,
                                                        location:
                                                            dropdownLocation);
                                                    await MallFirestoreDb
                                                        .addmall(mallModel);
                                                    mallController.clear();
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
                      child: const Text("Add Mall")),
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
                      controller: searchMallController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        hintText: "Search mall",
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
              child: DataWidget(
                  data1: "Location", data2: "Mall", data3: "", data4: ""),
            ),
            const SizedBox(
              height: 10,
            ),
            searchMallController.text.isNotEmpty
                ? Container(
                    height: 500,
                    color: Colors.white,
                    child: GetX<MallController>(
                        init: Get.put(MallController()),
                        builder: (MallController locationController) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: locationController.mall.length,
                            itemBuilder: (context, index) {
                              final location0 = locationController.mall[index];
                              if (searchMallController.text
                                  .contains(location0.mall.toLowerCase())) {
                                return Material(
                                  type: MaterialType.transparency,
                                  child: ListTile(
                                    hoverColor: Colors.amber,
                                    onTap: () {
                                      showPromotionDetails(location0);
                                    },
                                    title: DataWidget(
                                      data1: location0.location,
                                      data2: location0.mall,
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
                    child: GetX<MallController>(
                        init: Get.put(MallController()),
                        builder: (MallController mallController) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: mallController.mall.length,
                            itemBuilder: (context, index) {
                              final mallModel0 = mallController.mall[index];
                              return Material(
                                type: MaterialType.transparency,
                                child: ListTile(
                                  hoverColor: Colors.amber,
                                  onTap: () {
                                    showPromotionDetails(mallModel0);
                                  },
                                  title: DataWidget(
                                    data1: mallModel0.location,
                                    data2: mallModel0.mall,
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
