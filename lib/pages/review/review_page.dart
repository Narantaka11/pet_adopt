import 'package:flutter/material.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  final TextEditingController _reviewController = TextEditingController();
  final List<String> _reviews = [
    "Great service, my pet arrived healthy! 🐾",
    "Fast delivery and helpful customer support.",
    "Very satisfied with the adoption process!",
    "The app is easy to use and the UI is beautiful.",
    "Excellent experience, will recommend to friends!",
    "My cat loves the toys I ordered here 😻",
    "Affordable prices and quality products.",
    "Definitely using this service again for my next pet!",
  ];

  void _addReview() {
    if (_reviewController.text.isNotEmpty) {
      setState(() {
        _reviews.insert(0, _reviewController.text);
        _reviewController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xff416d6d),
        automaticallyImplyLeading: false,
        title: const Text("Reviews", style: TextStyle(color: Colors.white)),
        titleTextStyle: TextStyle(fontSize:22,fontWeight:  FontWeight.bold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  const Icon(Icons.edit, color:Color(0xff416d6d)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _reviewController,
                      decoration: const InputDecoration(
                        hintText: "Write your review...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Color(0xff416d6d)),
                    onPressed: _addReview,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _reviews.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 3, offset: const Offset(0, 2)),
                      ],
                    ),
                    child: Text(_reviews[index]),
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
