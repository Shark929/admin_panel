import 'package:admin_panel/constants/category_firestore_db.dart';
import 'package:admin_panel/controller/category_controller.dart';
import 'package:admin_panel/models/category_model.dart';
import 'package:admin_panel/widgets/data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  TextEditingController categoryController = TextEditingController();
  TextEditingController searchLocationController = TextEditingController();
  void showPromotionDetails(CategoryModel model) {
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
                    "Category: ${model.category}",
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
                          CategoryFirestoreDb.deleteCategory(model.categoryId!);
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
              "Categories",
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
                                          "New Category",
                                          style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextField(
                                          controller: categoryController,
                                          decoration: const InputDecoration(
                                              hintText: "Category name"),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              child: ElevatedButton(
                                                  onPressed: () async {
                                                    final categoryModel =
                                                        CategoryModel(
                                                            category:
                                                                categoryController
                                                                    .text);

                                                    await CategoryFirestoreDb
                                                        .addCategory(
                                                            categoryModel);
                                                    categoryController.clear();
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
                      child: const Text("Add Category")),
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
                        hintText: "Search category",
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
                  data1: "Category", data2: "", data3: "", data4: ""),
            ),
            const SizedBox(
              height: 10,
            ),
            searchLocationController.text.isNotEmpty
                ? Container(
                    height: 500,
                    color: Colors.white,
                    child: GetX<CategoryController>(
                        init: Get.put(CategoryController()),
                        builder: (CategoryController categoryController) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: categoryController.category.length,
                            itemBuilder: (context, index) {
                              final location0 =
                                  categoryController.category[index];
                              if (searchLocationController.text
                                  .contains(location0.category.toLowerCase())) {
                                return Material(
                                  type: MaterialType.transparency,
                                  child: ListTile(
                                    hoverColor: Colors.amber,
                                    onTap: () {
                                      showPromotionDetails(location0);
                                    },
                                    title: DataWidget(
                                      data1: location0.category,
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
                    child: GetX<CategoryController>(
                        init: Get.put(CategoryController()),
                        builder: (CategoryController categoryController) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: categoryController.category.length,
                            itemBuilder: (context, index) {
                              final promotionModel0 =
                                  categoryController.category[index];
                              return Material(
                                type: MaterialType.transparency,
                                child: ListTile(
                                  hoverColor: Colors.amber,
                                  onTap: () {
                                    showPromotionDetails(promotionModel0);
                                  },
                                  title: DataWidget(
                                    data1: promotionModel0.category,
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
