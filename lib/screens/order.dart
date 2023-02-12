import 'package:admin_panel/controller/order_controller.dart';
import 'package:admin_panel/controller/order_history_controller.dart';
import 'package:admin_panel/models/order_history_model.dart';
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
  TextEditingController searchNameController = TextEditingController();
  void showPromotionDetails(MyCartModel model) {
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
                    "Order: ${model.itemName}",
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
                      controller: searchNameController,
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
                  data2: "Item price",
                  data3: "Quantity",
                  data4: "Total price"),
            ),
            const SizedBox(
              height: 10,
            ),
            searchNameController.text.isNotEmpty
                ? Container(
                    height: 500,
                    color: Colors.white,
                    child: GetX<OrderHistoryController>(
                        init: Get.put(OrderHistoryController()),
                        builder: (OrderHistoryController oController) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: oController.orderHistory.length,
                            itemBuilder: (context, index) {
                              final location0 = oController.orderHistory[index];
                              if (searchNameController.text
                                  .contains(location0.itemName.toLowerCase())) {
                                double totalPrice = double.parse(
                                        location0.quantity.toString()) *
                                    double.parse(
                                        location0.itemPrice.toString());
                                return Material(
                                  type: MaterialType.transparency,
                                  child: ListTile(
                                      hoverColor: Colors.amber,
                                      onTap: () {
                                        showPromotionDetails(location0);
                                      },
                                      title: DataWidget(
                                          data1: location0.itemName,
                                          data2: "RM ${location0.itemPrice}",
                                          data3: "X${location0.quantity}",
                                          data4: "RM ${location0.totalPrice}")),
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
                    child: GetX<OrderHistoryController>(
                        init: Get.put(OrderHistoryController()),
                        builder: (OrderHistoryController ohController) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: ohController.orderHistory.length,
                              itemBuilder: (context, index) {
                                final ohModel =
                                    ohController.orderHistory[index];
                                return Container(
                                  margin: const EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  child: ListTile(
                                      title: DataWidget(
                                          data1: ohModel.itemName,
                                          data2: "RM ${ohModel.itemPrice}",
                                          data3: "X${ohModel.quantity}",
                                          data4: "RM ${ohModel.totalPrice}")),
                                );
                              });
                        })),
          ],
        ),
      ),
    );
  }
}
