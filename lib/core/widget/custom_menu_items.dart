import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomMenuItems extends StatelessWidget {
  final String itemTitle;
  final String itemImage;

  final void Function()? onTap;

  const CustomMenuItems({
    super.key,
    required this.itemTitle,
    required this.itemImage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 20, offset: Offset(0, 4))
          ], borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: Colors.brown,
                    ),
                  ),
                  imageUrl: itemImage,
                  height: 115,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  itemTitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
