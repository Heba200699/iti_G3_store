import 'package:flutter/material.dart';


class CategoryModel {
  final String title;
  final String imagePath;
  final Color color;

  CategoryModel({
    required this.title,
    required this.imagePath,
    required this.color,
  });
}

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  // لستة الـ 9 أقسام والألوان الخاصة بكل دايرة
  final List<CategoryModel> categories = [
    CategoryModel(
      title: 'Fruits',
      imagePath: 'assets/images/noun_Fruit_2287486 1.png',
      color: const Color(0xFFFAF2F5), // لون دايـرة الفواكه
    ),
    CategoryModel(
      title: 'Vegetables',
      imagePath: 'assets/images/noun_pumpkin_4002936 1.png',
      color: const Color(0xffFFD9BA), // لون دايـرة الخضروات
    ),
    CategoryModel(
      title: 'Meat',
      imagePath: 'assets/images/noun_Meat_3765650 1.png',
      color: const Color(0xffFACCCC), // لون دايـرة اللحوم
    ),
    CategoryModel(
      title: 'Fish',
      imagePath: 'assets/images/noun_Fish_2205410 1.png',
      color: const Color(0xffFACCCC), // لون دايـرة السمك
    ),
    CategoryModel(
      title: 'Sea food',
      imagePath: 'assets/images/noun_Shrimp_703278 1.png',
      color: const Color(0xffFFE299), // لون دايـرة الجمبري
    ),
    CategoryModel(
      title: 'Juice',
      imagePath: 'assets/images/Vector.png',
      color: const Color(0xffD3E5C4), // لون دايـرة العصير
    ),
    CategoryModel(
      title: 'Egg & Milk',
      imagePath: 'assets/images/Group 7084.png',
      color: const Color(0xffDAF2FC), // لون دايـرة اللبن والبيض
    ),
    CategoryModel(
      title: 'Ice cream',
      imagePath: 'assets/images/Group.png',
      color: const Color(0xffFFDEF6), // لون دايـرة الآيس كريم
    ),
    CategoryModel(
      title: 'Bakery',
      imagePath: 'assets/images/Group 7085.png',
      color: const Color(0xffFECA97), // لون دايـرة المخبوزات
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF4A3B32), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Categories',
          style: TextStyle(
            color: Color(0xffFF5E00),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // شريط البحث (Search Bar)
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFFF9F9F9),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFD67D56)),
                ),
              ),
            ),
            const SizedBox(height: 20),


            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      CircleAvatar(
                        radius: 38,
                        backgroundColor: category.color, // اللون الخاص بكل قسم
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Image.asset(
                            category.imagePath,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        category.title,
                        style: const TextStyle(
                          color: Color(0xFF4A3B32),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}