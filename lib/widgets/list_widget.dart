import 'package:admin_panel/controller/label_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListWidget extends StatelessWidget {
  final String title;
  final List list;
  ListWidget({super.key, required this.title, required this.list});
  final controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xffACACAC),
            ),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                controller.getLabel(setLabel: list[index]);
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  list[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
