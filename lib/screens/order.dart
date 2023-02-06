import 'package:admin_panel/controller/order_controller.dart';
import 'package:admin_panel/models/order_model.dart';
import 'package:admin_panel/widgets/data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  TextEditingController locationController = TextEditingController();
  TextEditingController searchLocationController = TextEditingController();
  void showPromotionDetails(OrderModel model) {
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
                    "Order: ${model.foodName}",
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
                          // PromotionFirestoreDb.deletePromotion(
                          //     model.locationId!);
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
              "Orders",
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
                      onPressed: () {}, child: const Text("Orders")),
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
                        hintText: "Search orders",
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
                  data1: "Orders",
                  data2: "Quantity",
                  data3: "Total Price",
                  data4: "Accepted/Rejected"),
            ),
            const SizedBox(
              height: 10,
            ),
            searchLocationController.text.isNotEmpty
                ? Container(
                    height: 500,
                    color: Colors.white,
                    child: GetX<OrderController>(
                        init: Get.put(OrderController()),
                        builder: (OrderController oController) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: oController.orderList.length,
                            itemBuilder: (context, index) {
                              final location0 = oController.orderList[index];
                              if (searchLocationController.text
                                  .contains(location0.foodName.toLowerCase())) {
                                double totalPrice = double.parse(
                                        location0.quantity.toString()) *
                                    double.parse(
                                        location0.foodPrice.toString());
                                return Material(
                                  type: MaterialType.transparency,
                                  child: ListTile(
                                    hoverColor: Colors.amber,
                                    onTap: () {
                                      showPromotionDetails(location0);
                                    },
                                    title: DataWidget(
                                      data1: location0.foodName,
                                      data2: location0.quantity.toString(),
                                      data3:
                                          "RM ${totalPrice.toStringAsFixed(2)}",
                                      data4: location0.code == "1"
                                          ? 'Customer make order'
                                          : location0.code == "2"
                                              ? "Vendor accepted order"
                                              : location0.code == "3"
                                                  ? "In progress"
                                                  : location0.code == "4"
                                                      ? "Completed"
                                                      : location0.code == "5"
                                                          ? "Closed"
                                                          : location0.code ==
                                                                  "6"
                                                              ? "Rejected"
                                                              : "",
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
                    child: GetX<OrderController>(
                        init: Get.put(OrderController()),
                        builder: (OrderController oController) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: oController.orderList.length,
                            itemBuilder: (context, index) {
                              final oModel = oController.orderList[index];
                              double totalPrice =
                                  double.parse(oModel.quantity.toString()) *
                                      double.parse(oModel.foodPrice.toString());
                              return Material(
                                type: MaterialType.transparency,
                                child: ListTile(
                                  hoverColor: Colors.amber,
                                  onTap: () {
                                    showPromotionDetails(oModel);
                                  },
                                  title: DataWidget(
                                    data1: oModel.foodName,
                                    data2: oModel.quantity.toString(),
                                    data3:
                                        "RM ${totalPrice.toStringAsFixed(2)}",
                                    data4: oModel.code == "1"
                                        ? 'Customer make order'
                                        : oModel.code == "2"
                                            ? "Vendor accepted order"
                                            : oModel.code == "3"
                                                ? "In progress"
                                                : oModel.code == "4"
                                                    ? "Completed"
                                                    : oModel.code == "5"
                                                        ? "Closed"
                                                        : oModel.code == "6"
                                                            ? "Rejected"
                                                            : "",
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
