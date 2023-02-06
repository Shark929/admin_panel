import 'package:admin_panel/constants/vendor_wallet_firestore_db.dart';
import 'package:admin_panel/controller/revenue_controller.dart';
import 'package:admin_panel/controller/vendor_wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 5 * 4,
      color: const Color.fromARGB(255, 255, 247, 222),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Home",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 250,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.amber,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Daily Sales",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        GetX<RevenueController>(
                            init: Get.put(RevenueController()),
                            builder: (RevenueController rController) {
                              var revenue = [];
                              double data = 0.0;
                              for (int i = 0;
                                  i < rController.revenues.length;
                                  i++) {
                                if (revenue.isEmpty ||
                                    revenue.length <
                                        rController.revenues.length) {
                                  revenue.add(rController.revenues[i].balance);
                                }
                              }

                              for (var e in revenue) {
                                data += double.parse(e);
                              }
                              return Text(
                                "RM ${data.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.amber,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "Monthly Sales",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.amber,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "Yearly Sales",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //withdraw request
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Withdraw request",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Container(
                height: 500,
                color: Colors.white,
                child: GetX<VendorWalletController>(
                    init: Get.put(VendorWalletController()),
                    builder: (VendorWalletController promotionController) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: promotionController.wallet.length,
                        itemBuilder: (context, index) {
                          final promotionModel0 =
                              promotionController.wallet[index];
                          if (promotionModel0.code == 0) {
                            return Material(
                              type: MaterialType.transparency,
                              child: ListTile(
                                hoverColor: Colors.amber,
                                onTap: () {
                                  VendorWalletFirestoreDb.updateStatus(
                                      1,
                                      promotionModel0.transactionId,
                                      double.parse(promotionModel0.amount));
                                },
                                title: Text(
                                  "RM ${promotionModel0.amount}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
