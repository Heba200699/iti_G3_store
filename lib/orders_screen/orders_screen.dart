import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {

  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Orders',
          style: TextStyle(
            color: Color(0xffFF5E00),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            // التبويبات (Ongoing و History) القابلة للضغط
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // زر Ongoing
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0; // تغيير الحالة عند الضغط
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Ongoing',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: selectedIndex == 0 ? FontWeight.bold : FontWeight.normal,
                          color: selectedIndex == 0 ? const Color(0xFFC62828) : Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (selectedIndex == 0)
                        Container(
                          height: 2,
                          width: 60,
                          color: const Color(0xFFC62828),
                        ),
                    ],
                  ),
                ),
                // زر History
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1; // تغيير الحالة عند الضغط
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'History',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: selectedIndex == 1 ? FontWeight.bold : FontWeight.normal,
                          color: selectedIndex == 1 ? const Color(0xffFF5E00) : Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (selectedIndex == 1)
                        Container(
                          height: 2,
                          width: 60,
                          color: const Color(0xffFF5E00),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // عرض محتوى مختلف حسب التبويب المختار باستخدام الـ State
            Expanded(
              child: selectedIndex == 1
                  ? ListView(
                children: const [
                  OrderItem(
                    orderNo: 'Order #345',
                    status: 'Delivered',
                    statusColor: Colors.green,
                    date: 'October 26, 2014',
                    price: '\$700',
                  ),
                  Divider(height: 32),
                  OrderItem(
                    orderNo: 'Order #346',
                    status: 'Cancelled',
                    statusColor: Colors.red,
                    date: 'October 14, 2016',
                    price: '\$452',
                  ),
                  Divider(height: 32),
                  OrderItem(
                    orderNo: 'Order #347',
                    status: 'Delivered',
                    statusColor: Colors.green,
                    date: 'July 26, 2017',
                    price: '\$281',
                  ),
                ],
              )
                  : const Center(
                child: Text(
                  'No Ongoing Orders',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// كلاس العنصر المنفرد
class OrderItem extends StatelessWidget {
  final String orderNo;
  final String status;
  final Color statusColor;
  final String date;
  final String price;

  const OrderItem({
    Key? key,
    required this.orderNo,
    required this.status,
    required this.statusColor,
    required this.date,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0xFFD84315),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_basket,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderNo,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 13,
                        color: statusColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      '  •  ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Text(
          price,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFFD84315),
          ),
        ),
      ],
    );
  }
}