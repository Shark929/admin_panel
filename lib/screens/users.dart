import 'package:admin_panel/constants/dashboard_firestore_db.dart';
import 'package:admin_panel/constants/user_firestore_db.dart';
import 'package:admin_panel/constants/vendor_firestore_db.dart';
import 'package:admin_panel/constants/vendor_wallet_firestore_db.dart';
import 'package:admin_panel/controller/user_controller.dart';
import 'package:admin_panel/controller/vendor_controller.dart';
import 'package:admin_panel/models/dashboard_model.dart';
import 'package:admin_panel/models/user_model.dart';
import 'package:admin_panel/models/vendor_model.dart';
import 'package:admin_panel/models/vendor_wallet.dart';
import 'package:admin_panel/widgets/data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  TextEditingController resNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  //user controller
  TextEditingController usernameController = TextEditingController();

  TextEditingController userEmailController = TextEditingController();

  TextEditingController userPhoneController = TextEditingController();

  //search controller
  TextEditingController searchVendorController = TextEditingController();

  TextEditingController searchcustomerController = TextEditingController();

  void showVendorDetails(VendorModel model) {
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
                    "Restaurant Name: ${model.vendorRestaurantName}",
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Email: ${model.vendorEmail}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Phone: ${model.vendorPhone}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Location: ${model.vendorLocation}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Mall: ${model.vendorMall}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  model.isAuthorise == false
                      ? InkWell(
                          onTap: () {
                            VendorFirestoreDb.authoriseVendor(
                                true, model.vendorId);
                            final newBalanceModel = WalletBalanceModel(
                                balance: "0", vendorId: model.vendorId!);
                            VendorWalletFirestoreDb.addNewBalance(
                                newBalanceModel, model.vendorId!);
                            VendorWalletFirestoreDb.addNewRevenue(
                                newBalanceModel, model.vendorId!);
                            final dashboardModel = DashboardModel(
                                totalOrders: "0",
                                totalCustomers: "0",
                                dineIn: "0",
                                takeAway: "0",
                                vendorId: model.vendorId!);
                            DashboardFirestoreDb.addVendorDashboard(
                                dashboardModel, model.vendorId!);
                          },
                          child: Container(
                            width: 150,
                            height: 50,
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.amber, width: 2),
                            ),
                            child: const Text(
                              "Authorise Vendor",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          );
        });
  }

  //showDialog customer
  void showCustomerDetails(UserModel model) {
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
                    "Username: ${model.username}",
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Email: ${model.email}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Phone: ${model.phoneNum}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Users",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Vendors",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                // SizedBox(
                //   width: 150,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       showDialog(
                //           context: context,
                //           builder: (context) => Dialog(
                //                 child: Container(
                //                   width: MediaQuery.of(context).size.width,
                //                   height: MediaQuery.of(context).size.height,
                //                   margin: const EdgeInsets.symmetric(
                //                     horizontal: 50,
                //                     vertical: 100,
                //                   ),
                //                   child: Column(
                //                     mainAxisAlignment:
                //                         MainAxisAlignment.spaceEvenly,
                //                     children: [
                //                       const Text(
                //                         "New Vendor",
                //                         style: TextStyle(
                //                           fontSize: 36,
                //                           fontWeight: FontWeight.w600,
                //                         ),
                //                       ),
                //                       TextField(
                //                         controller: resNameController,
                //                         decoration: const InputDecoration(
                //                             hintText: "Restaurant name"),
                //                       ),
                //                       TextField(
                //                         controller: emailController,
                //                         decoration: const InputDecoration(
                //                             hintText: "Email"),
                //                       ),
                //                       TextField(
                //                         controller: phoneController,
                //                         decoration: const InputDecoration(
                //                             hintText: "Phone"),
                //                       ),
                //                       Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.spaceEvenly,
                //                         children: [
                //                           SizedBox(
                //                             width: 150,
                //                             child: ElevatedButton(
                //                                 onPressed: () async {
                //                                   final vendorModel =
                //                                       VendorModel(
                //                                           vendorId: "1",
                //                                           vendorRestaurantName:
                //                                               resNameController
                //                                                   .text,
                //                                           vendorEmail:
                //                                               emailController
                //                                                   .text,
                //                                           vendorPhone:
                //                                               phoneController
                //                                                   .text,
                //                                           vendorLocation: '',
                //                                           vendorMall: '',
                //                                           vendorImage: '',
                //                                           isAuthorise: false);

                //                                   await VendorFirestoreDb
                //                                       .addVendor(vendorModel);

                //                                   resNameController.clear();
                //                                   emailController.clear();
                //                                   phoneController.clear();
                //                                 },
                //                                 child: const Text("Confirm")),
                //                           ),
                //                           SizedBox(
                //                             width: 150,
                //                             child: ElevatedButton(
                //                                 style: const ButtonStyle(
                //                                   backgroundColor:
                //                                       MaterialStatePropertyAll<
                //                                           Color>(Colors.red),
                //                                 ),
                //                                 onPressed: () {
                //                                   Navigator.pop(context);
                //                                 },
                //                                 child: const Text("Cancel")),
                //                           ),
                //                         ],
                //                       )
                //                     ],
                //                   ),
                //                 ),
                //               ));
                //     },
                //     child: const Text("Add new vendor"),
                //   ),
                // ),
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
                      controller: searchVendorController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        hintText: "Search vendor",
                        border: InputBorder.none,
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                // ElevatedButton(onPressed: () {}, child: const Text("Search")),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const DataWidget(
              data1: "Restaurant name",
              data2: "Email",
              data3: "Phone",
              data4: "Authorise",
            ),
            const SizedBox(
              height: 10,
            ),
            searchVendorController.text.isNotEmpty
                ? Container(
                    height: 300,
                    color: Colors.white,
                    child: GetX<VendorController>(
                        init: Get.put(VendorController()),
                        builder: (VendorController vendorController) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: vendorController.vendor.length,
                              itemBuilder: (BuildContext context, int index) {
                                final vendorModel0 =
                                    vendorController.vendor[index];

                                if (searchVendorController.text
                                    .toLowerCase()
                                    .contains(vendorModel0.vendorRestaurantName
                                        .toLowerCase())) {
                                  return Material(
                                    type: MaterialType.transparency,
                                    child: ListTile(
                                      hoverColor: Colors.amber,
                                      onTap: () {
                                        showVendorDetails(vendorModel0);
                                      },
                                      title: DataWidget(
                                          data1:
                                              vendorModel0.vendorRestaurantName,
                                          data2: vendorModel0.vendorEmail,
                                          data3: vendorModel0.vendorPhone,
                                          data4:
                                              vendorModel0.isAuthorise == false
                                                  ? "Not Authorise"
                                                  : "Authorized"),
                                    ),
                                  );
                                }
                                return const SizedBox();
                              });
                        }),

                    //customers
                  )
                : Container(
                    height: 300,
                    color: Colors.white,
                    child: GetX<VendorController>(
                        init: Get.put(VendorController()),
                        builder: (VendorController vendorController) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: vendorController.vendor.length,
                              itemBuilder: (BuildContext context, int index) {
                                final vendorModel0 =
                                    vendorController.vendor[index];

                                return Material(
                                  type: MaterialType.transparency,
                                  child: ListTile(
                                    tileColor: vendorModel0.isAuthorise == false
                                        ? Colors.red
                                        : Colors.white,
                                    hoverColor: Colors.amber,
                                    onTap: () {
                                      showVendorDetails(vendorModel0);
                                    },
                                    title: DataWidget(
                                        data1:
                                            vendorModel0.vendorRestaurantName,
                                        data2: vendorModel0.vendorEmail,
                                        data3: vendorModel0.vendorPhone,
                                        data4: vendorModel0.isAuthorise == false
                                            ? "Not Authorise"
                                            : "Authorized"),
                                  ),
                                );
                              });
                        }),

                    //customers
                  ),
            //customers
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Customers",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                // SizedBox(
                //   width: 120,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       showDialog(
                //           context: context,
                //           builder: (context) => Dialog(
                //                 child: Container(
                //                   width: MediaQuery.of(context).size.width,
                //                   height: MediaQuery.of(context).size.height,
                //                   margin: const EdgeInsets.symmetric(
                //                     horizontal: 50,
                //                     vertical: 100,
                //                   ),
                //                   child: Column(
                //                     mainAxisAlignment:
                //                         MainAxisAlignment.spaceEvenly,
                //                     children: [
                //                       const Text(
                //                         "New User",
                //                         style: TextStyle(
                //                           fontSize: 36,
                //                           fontWeight: FontWeight.w600,
                //                         ),
                //                       ),
                //                       TextField(
                //                         controller: usernameController,
                //                         decoration: const InputDecoration(
                //                             hintText: "Username"),
                //                       ),
                //                       TextField(
                //                         controller: userEmailController,
                //                         decoration: const InputDecoration(
                //                             hintText: "Email"),
                //                       ),
                //                       TextField(
                //                         controller: userPhoneController,
                //                         decoration: const InputDecoration(
                //                             hintText: "Phone"),
                //                       ),
                //                       Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.spaceEvenly,
                //                         children: [
                //                           SizedBox(
                //                             width: 150,
                //                             child: ElevatedButton(
                //                                 onPressed: () async {
                //                                   final userModel = UserModel(
                //                                       username:
                //                                           usernameController
                //                                               .text,
                //                                       email: userEmailController
                //                                           .text,
                //                                       phoneNum:
                //                                           userPhoneController
                //                                               .text,
                //                                       profilePicture: '');

                //                                   // await VendorFirestoreDb
                //                                   //     .addVendor(vendorModel);

                //                                   await UserFirestoreDb.addUser(
                //                                       userModel);
                //                                   usernameController.clear();
                //                                   userEmailController.clear();
                //                                   userPhoneController.clear();
                //                                 },
                //                                 child: const Text("Confirm")),
                //                           ),
                //                           SizedBox(
                //                             width: 150,
                //                             child: ElevatedButton(
                //                                 style: const ButtonStyle(
                //                                   backgroundColor:
                //                                       MaterialStatePropertyAll<
                //                                           Color>(Colors.red),
                //                                 ),
                //                                 onPressed: () {
                //                                   Navigator.pop(context);
                //                                 },
                //                                 child: const Text("Cancel")),
                //                           ),
                //                         ],
                //                       )
                //                     ],
                //                   ),
                //                 ),
                //               ));
                //     },
                //     child: const Text("Add"),
                //   ),
                // ),
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
                      controller: searchcustomerController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        hintText: "Search customer",
                        border: InputBorder.none,
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const DataWidget(
              data1: "Username",
              data2: "Email",
              data3: "Phone",
              data4: "",
            ),
            const SizedBox(
              height: 10,
            ),
            searchcustomerController.text.isNotEmpty
                ? Container(
                    height: 300,
                    color: Colors.white,
                    child: GetX<UserController>(
                        init: Get.put(UserController()),
                        builder: (UserController userController) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: userController.users.length,
                              itemBuilder: (BuildContext context, int index) {
                                final userModel0 = userController.users[index];
                                if (searchcustomerController.text.contains(
                                    userModel0.username.toLowerCase())) {
                                  return Material(
                                    type: MaterialType.transparency,
                                    child: ListTile(
                                      hoverColor: Colors.amber,
                                      onTap: () {
                                        showCustomerDetails(userModel0);
                                      },
                                      title: DataWidget(
                                        data1: userModel0.username,
                                        data2: userModel0.email,
                                        data3: userModel0.phoneNum,
                                        data4: "",
                                      ),
                                    ),
                                  );
                                }
                                return const SizedBox();
                              });
                        }),
                  )
                : Container(
                    height: 300,
                    color: Colors.white,
                    child: GetX<UserController>(
                        init: Get.put(UserController()),
                        builder: (UserController userController) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: userController.users.length,
                              itemBuilder: (BuildContext context, int index) {
                                final userModel0 = userController.users[index];

                                return Material(
                                  type: MaterialType.transparency,
                                  child: ListTile(
                                    hoverColor: Colors.amber,
                                    onTap: () {
                                      showCustomerDetails(userModel0);
                                    },
                                    title: DataWidget(
                                      data1: userModel0.username,
                                      data2: userModel0.email,
                                      data3: userModel0.phoneNum,
                                      data4: "",
                                    ),
                                  ),
                                );
                              });
                        }),
                  ),
          ]),
        ),
      ),
    );
  }
}
