import 'package:flutter/material.dart';

class CartItemModel {
  final String title;
  final String imagePath;
  final String price;
  int quantity;

  CartItemModel({
    required this.title,
    required this.imagePath,
    required this.price,
    this.quantity = 1,
  });
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItemModel> cartItems = [
    CartItemModel(
      title: 'Red Apple',
      imagePath: 'assets/images/purepng 1.png',
      price: '\$4.99 kg',
      quantity: 2,
    ),
    CartItemModel(
      title: 'Orginal Banana',
      imagePath: 'assets/images/PikPng 1.png',
      price: '\$5.99 kg',
      quantity: 2,
    ),
    CartItemModel(
      title: 'Squash',
      imagePath: 'assets/images/noun_pumpkin_4002936 1.png',
      price: '\$24 st',
      quantity: 1,
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
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF4A3B32),
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),

        title: const Text(
          'Cart',
          style: TextStyle(
            color: Color(0xffFF5E00),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cartItems.length,

                itemBuilder: (context, index) {
                  final item = cartItems[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      color: const Color(0xFFFAF8F6),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.grey.shade200,
                      ),
                    ),

                    child: Row(
                      children: [
                        // Product Image
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              item.imagePath,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        const SizedBox(width: 16),

                        // Product Information
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                  color: Color(0xFF4A3B32),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),

                              const SizedBox(height: 12),

                              Row(
                                children: [
                                  // Minus Button
                                  GestureDetector(
                                    onTap: () {
                                      if (item.quantity > 1) {
                                        setState(() {
                                          item.quantity--;
                                        });
                                      }
                                    },

                                    child: Container(
                                      width: 28,
                                      height: 28,

                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),

                                      child: const Icon(
                                        Icons.remove,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),

                                  // Quantity
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),

                                    child: Text(
                                      '${item.quantity}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Color(0xFF4A3B32),
                                      ),
                                    ),
                                  ),

                                  // Plus Button
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        item.quantity++;
                                      });
                                    },

                                    child: Container(
                                      width: 28,
                                      height: 28,

                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),

                                      child: const Icon(
                                        Icons.add,
                                        size: 16,
                                        color: Color(0xFFD67D56),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Price + Delete
                        Row(
                          children: [
                            Text(
                              item.price,
                              style: const TextStyle(
                                color: Color(0xFF4A3B32),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),

                            const SizedBox(width: 4),

                            // Delete Button
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  cartItems.removeAt(index);
                                });
                              },

                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                                size: 22,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Checkout Button
            Container(
              width: double.infinity,
              height: 55,
              margin: const EdgeInsets.only(bottom: 20),

              child: ElevatedButton(
                onPressed: () {},

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFF5E00),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),

                  elevation: 0,
                ),

                child: const Text(
                  'CheckOut',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}