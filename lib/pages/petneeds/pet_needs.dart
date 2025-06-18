import 'package:flutter/material.dart';

class PetNeedsPage extends StatefulWidget {
  const PetNeedsPage({super.key});

  @override
  State<PetNeedsPage> createState() => _PetNeedsPageState();
}

class _PetNeedsPageState extends State<PetNeedsPage> {
  String selectedCategory = 'Food';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search needs",
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Filter Buttons
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryButton("Food", Icons.restaurant),
                  _buildCategoryButton("Vitamin", Icons.medical_services),
                  _buildCategoryButton("Toy", Icons.toys),
                  _buildCategoryButton("Equipment", Icons.pets),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // List of Needs
            Expanded(
              child: ListView(
                children: _getFilteredItems(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String label, IconData icon) {
    final bool isSelected = selectedCategory == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = label;
        });
      },
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF476D6D) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            if (isSelected)
              const BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: isSelected ? Colors.white : const Color(0xFF476D6D)),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : const Color(0xFF476D6D),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getFilteredItems() {
    switch (selectedCategory) {
      case 'Food':
        return [
          _buildNeedCard('lib/assets/images/food1.png', "Royal Canin", "Dry Food", "\$25", "10"),
          _buildNeedCard('lib/assets/images/food2.png', "Whiskas", "Wet Food", "\$18", "12"),
          _buildNeedCard('lib/assets/images/food3.png', "Pedigree", "Puppy Food", "\$22", "8"),
          _buildNeedCard('lib/assets/images/food4.png', "Brit", "Cat Food", "\$20", "14"),
        ];
      case 'Vitamin':
        return [
          _buildNeedCard('lib/assets/images/vitamin1.png', "Pet Vitamin C", "Vitamin C", "\$10", "5"),
          _buildNeedCard('lib/assets/images/vitamin2.png', "Omega 3", "Fish Oil", "\$12", "7"),
          _buildNeedCard('lib/assets/images/vitamin3.png', "Multivit", "Multi Vitamin", "\$9", "6"),
          _buildNeedCard('lib/assets/images/vitamin4.png', "Glucosamine", "For Bones", "\$14", "4"),
        ];
      case 'Toy':
        return [
          _buildNeedCard('lib/assets/images/toy_ball.png', "Toy Ball", "Toys For Cats", "\$7", "7"),
          _buildNeedCard('lib/assets/images/toy_mouse.png', "Toy Mouse", "Toys For Cats", "\$6", "6"),
          _buildNeedCard('lib/assets/images/toy_rope.png', "Toy Rope", "Toys For Dogs", "\$8", "10"),
          _buildNeedCard('lib/assets/images/toy_feather.png', "Toy Feather", "Interactive Toys", "\$9", "9"),
        ];
      case 'Equipment':
        return [
          _buildNeedCard('lib/assets/images/tools1.png', "Animals Comb", "Grooming", "\$5", "3"),
          _buildNeedCard('lib/assets/images/tools2.png', "Feeding Bowl", "For Foods", "\$6", "5"),
          _buildNeedCard('lib/assets/images/tools3.png', "Pet Carrier", "Carrier", "\$25", "2"),
        ];
      default:
        return [];
    }
  }

  Widget _buildNeedCard(
    String imagePath,
    String title,
    String subtitle,
    String price,
    String stock,
  ) {
    return Container(
      height: 240,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              width: 180,
              height: double.infinity,
              color: const Color(0xFF476D6D),
              alignment: Alignment.center,
              child: Image.asset(
                imagePath,
                height: 200,
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                  const SizedBox(height: 8),
                  Text("Price: $price", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text("Stock: $stock", style: const TextStyle(fontSize: 14)),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                          content: Text('$title Adding to cart'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF476D6D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text("Add to cart", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
