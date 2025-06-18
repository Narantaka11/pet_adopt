import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Color(0xff416d6d),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "My Cart",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
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
            const Divider(height: 32, color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Total", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("\$50", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/payment');
              },
              icon: const Icon(Icons.shopping_cart_checkout),
              label: const Text("Order Now"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff416d6d),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
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
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFF6F6F6),
            ),
            child: Image.asset(image, fit: BoxFit.contain),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Color: $color", style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Text("\$$price", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Icon(icon, size: 16, color: const Color(0xFF4E6E6A)),
    );
  }
}
