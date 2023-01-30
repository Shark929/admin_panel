import 'package:flutter/material.dart';

class DataWidget extends StatelessWidget {
  final String data1, data2, data3, data4;
  const DataWidget(
      {super.key,
      required this.data1,
      required this.data2,
      required this.data3,
      required this.data4});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 5.5,
          alignment: Alignment.centerLeft,
          child: Text(data1),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 5.5,
          alignment: Alignment.centerLeft,
          child: Text(data2),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 5.5,
          alignment: Alignment.centerLeft,
          child: Text(data3),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 5.5,
          alignment: Alignment.centerLeft,
          child: Text(data4),
        ),
      ],
    );
  }
}
