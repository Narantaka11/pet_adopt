import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "My Cart",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildCartItem(
                    image: 'lib/assets/images/food1.png',
                    title: 'Royal Canin',
                    color: 'Red',
                    price: 25,
                  ),
                  _buildCartItem(
                    image: 'lib/assets/images/food2.png',
                    title: 'Whiskas',
                    color: 'Orange',
                    price: 18,
                  ),
                  _buildCartItem(
                    image: 'lib/assets/images/toy_ball.png',
                    title: 'Toy Ball',
                    color: 'Blue',
                    price: 7,
                  ),
                ],
              ),
            ),
            const Divider(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Total", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("\$50", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Order Now", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem({
    required String image,
    required String title,
    required String color,
    required int price,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xFFF6F6F6),
            ),
            child: Image.asset(image, fit: BoxFit.contain),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text("Color: $color", style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Text("\$$price", style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          Row(
            children: [
              _quantityButton(icon: Icons.remove),
              const SizedBox(width: 8),
              const Text("1", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              _quantityButton(icon: Icons.add),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quantityButton({required IconData icon}) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Icon(icon, size: 16),
    );
  }
}
