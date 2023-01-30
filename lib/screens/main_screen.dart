import 'package:admin_panel/constants/constants.dart';
import 'package:admin_panel/constants/location_firestore_db.dart';
import 'package:admin_panel/controller/location_controller.dart';
import 'package:admin_panel/models/location_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int screenIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Foodie",
        ),
      ),
      body: Row(
        children: [
          Container(
            width: size.width / 5 * 1,
            height: size.height,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: screensLabel.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: ListTile(
                      hoverColor: Colors.amber,
                      onTap: () {
                        setState(() {
                          screenIndex = index;
                        });
                      },
                      title: Text(screensLabel[index]),
                    ),
                  );
                }),
          ),
          Container(
            width: size.width / 5 * 4,
            height: size.height,
            child: screens[screenIndex],
          ),
        ],
      ),
    );
  }
}
