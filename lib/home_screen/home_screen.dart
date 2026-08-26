import 'package:flutter/material.dart';
import 'categories_item.dart';

// Popular Deals
class ProductModel {
  final String name;
  final String price;
  final String imagePath;

  ProductModel({required this.name, required this.price, required this.imagePath});
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);


  final List<CategoryModel> categories = [
    CategoryModel(title: 'Fruits', imagePath: 'assets/images/noun_Fruit_2287486 1.png'),
    CategoryModel(title: 'Vegetables', imagePath: 'assets/images/noun_pumpkin_4002936 1.png'),
    CategoryModel(title: 'Meat', imagePath: 'assets/images/noun_Meat_3765650 1.png'),
    CategoryModel(title: 'Fish', imagePath: 'assets/images/noun_Fish_2205410 1.png'),
  ];

  //  Popular Deals
  final List<ProductModel> popularDeals = [
    ProductModel(name: 'Red Apple', price: '\$ 4.99', imagePath: 'assets/images/purepng 1.png'),
    ProductModel(name: 'Orginal Banana', price: '\$ 5.99', imagePath: 'assets/images/PikPng 1.png'),
    ProductModel(name: 'cake', price: '\$ 4.00', imagePath: 'assets/images/Group 7085.png'),
    ProductModel(name: 'chrimp', price: '\$ 3.50', imagePath: 'assets/images/noun_Shrimp_703278 1.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // شريط التطبيق العلوي
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Color(0xFF4A3B32),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. صورة البانر العلوي الثابتة
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/complimentary-dish 1.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 2. عنوان قسم الكاتيجوريز
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6D3805),
                        ),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(
                          color: Color(0xFFD67D56),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),


                  SizedBox(
                    height: 105,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return CategoriesItem(
                          width:86,
                          categName: category.title,
                          categImage: category.imagePath,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Popular Deals',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6D3805),
                        ),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(
                          color: Color(0xFFD67D56),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Popular Deals
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: popularDeals.length,
                      itemBuilder: (context, index) {
                        final product = popularDeals[index];
                        return Container(
                          width: 145,
                          margin: const EdgeInsets.only(right: 16),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF9F9F9),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Image.asset(
                                    product.imagePath,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4A3B32),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.price,
                                    style: const TextStyle(
                                      color: Color(0xFF4A3B32),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Color(0xFF4CAF50),
                                    child: Icon(Icons.add, size: 16, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
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