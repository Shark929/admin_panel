import 'package:admin_panel/constants/location_firestore_db.dart';
import 'package:admin_panel/constants/promotion_firestore_db.dart';
import 'package:admin_panel/controller/location_controller.dart';
import 'package:admin_panel/controller/promotion_controller.dart';
import 'package:admin_panel/models/location_model.dart';
import 'package:admin_panel/models/promotion_model.dart';
import 'package:admin_panel/widgets/data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  TextEditingController locationController = TextEditingController();
  TextEditingController searchLocationController = TextEditingController();
  void showPromotionDetails(LocationModel model) {
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
                    "Location: ${model.locationName}",
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
                          PromotionFirestoreDb.deletePromotion(
                              model.locationId!);
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
              "Locations",
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
                                          "New Location",
                                          style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextField(
                                          controller: locationController,
                                          decoration: const InputDecoration(
                                              hintText: "Location name"),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              child: ElevatedButton(
                                                  onPressed: () async {
                                                    final locationModel =
                                                        LocationModel(
                                                            locationName:
                                                                locationController
                                                                    .text);

                                                    await LocationFirestoreDb
                                                        .addLocation(
                                                            locationModel);
                                                    locationController.clear();
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
                      child: const Text("Add Location")),
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
                      controller: searchLocationController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        hintText: "Search location",
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
                  data1: "Location", data2: "", data3: "", data4: ""),
            ),
            const SizedBox(
              height: 10,
            ),
            searchLocationController.text.isNotEmpty
                ? Container(
                    height: 500,
                    color: Colors.white,
                    child: GetX<LocationController>(
                        init: Get.put(LocationController()),
                        builder: (LocationController locationController) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: locationController.location.length,
                            itemBuilder: (context, index) {
                              final location0 =
                                  locationController.location[index];
                              if (searchLocationController.text.contains(
                                  location0.locationName.toLowerCase())) {
                                return Material(
                                  type: MaterialType.transparency,
                                  child: ListTile(
                                    hoverColor: Colors.amber,
                                    onTap: () {
                                      showPromotionDetails(location0);
                                    },
                                    title: DataWidget(
                                      data1: location0.locationName,
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
                    child: GetX<LocationController>(
                        init: Get.put(LocationController()),
                        builder: (LocationController locationController) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: locationController.location.length,
                            itemBuilder: (context, index) {
                              final promotionModel0 =
                                  locationController.location[index];
                              return Material(
                                type: MaterialType.transparency,
                                child: ListTile(
                                  hoverColor: Colors.amber,
                                  onTap: () {
                                    showPromotionDetails(promotionModel0);
                                  },
                                  title: DataWidget(
                                    data1: promotionModel0.locationName,
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
