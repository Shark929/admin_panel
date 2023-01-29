import 'package:admin_panel/constants/constants.dart';
import 'package:admin_panel/widgets/list_widget.dart';
import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  TabWidget({super.key});

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4 * 1,
      height: MediaQuery.of(context).size.height,
      color: const Color(0xff3A4073),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffD7D7D7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                ),
                hintText: "Search...",
                hintStyle: TextStyle(
                  color: Color(0xff9B9B9B),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListWidget(
                    title: "Sales",
                    list: list1,
                  ),
                  ListWidget(
                    title: "Vendors",
                    list: list1,
                  ),
                  ListWidget(
                    title: "Users",
                    list: users,
                  ),
                  ListWidget(
                    title: "Title 4",
                    list: list1,
                  ),
                  ListWidget(
                    title: "Title 5",
                    list: list1,
                  ),
                  ListWidget(
                    title: "Title 6",
                    list: list1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
