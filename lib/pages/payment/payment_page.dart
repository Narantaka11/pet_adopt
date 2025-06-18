import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xff416d6d),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Payment",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Total Payment",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xff416d6d), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Text(
                "\$50",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  color: Color(0xff416d6d),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Choose Payment Method",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            _buildPaymentOption(icon: Icons.credit_card, label: "Credit / Debit Card"),
            _buildPaymentOption(icon: Icons.account_balance_wallet, label: "E-Wallet"),
            _buildPaymentOption(icon: Icons.account_balance, label: "Bank Transfer"),
            _buildPaymentOption(icon: Icons.money, label: "Cash on Delivery"),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset(
                          'lib/assets/animations/success.json', // animasi sukses
                          height: 150,
                          repeat: true,
                        ),
                        const SizedBox(height: 16),
                        const Text("Payment Successful!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil('/home', (route) => false);
                          },
                          style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff416d6d),
                          foregroundColor: Colors.white),
                          child: const Text("Success"),
                        ),
                      ],
                    ),
                  ),
                ),
              );

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff416d6d),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Pay Now", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption({required IconData icon, required String label}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xff416d6d)),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
