import 'package:admin_panel/constants/constants.dart';
import 'package:flutter/material.dart';

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
          SizedBox(
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
          SizedBox(
            width: size.width / 5 * 4,
            height: size.height,
            child: screens[screenIndex],
          ),
        ],
      ),
    );
  }
}
