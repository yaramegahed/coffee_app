import 'package:flutter/material.dart';

class CustomMenuItems extends StatelessWidget {
  final String itemTitle;
  final String itemImage;
  const CustomMenuItems({
    super.key, required this.itemTitle, required this.itemImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 14,
            mainAxisSpacing: 16,
            childAspectRatio: 0.6),
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                itemImage,
                width: 100,
                height: 120,
              ),
              Text(
                itemTitle,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
