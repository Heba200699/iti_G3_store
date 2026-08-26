import 'package:flutter/material.dart';

class CategoryModel {
  final String title;
  final String imagePath;

  CategoryModel({
    required this.title,
    required this.imagePath,
  });
}

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    super.key,
    required this.categName,
    required this.categImage, required int width,
  });

  final String categName;
  final String categImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: const Color(0xFFECE6ED), // لون موحد هادئ مطابق لفيجما
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                categImage,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            categName,
            style: const TextStyle(
              color: Color(0xFF4A3B32),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}