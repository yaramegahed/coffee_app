import 'package:flutter/material.dart';

import 'drop_down_section.dart';

class CustomizeContainerContent extends StatelessWidget {
  final Widget? child;
  final double? height;

  const CustomizeContainerContent({
    super.key,
    this.child,
    this.height = 160,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: child ??
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cup Options",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                DropDownSection(
                  title: "Cup Size",
                  items: ["Large", "Small", "Med"],
                  hint: "Choose your size",
                ),
              ],
            ));
  }
}
