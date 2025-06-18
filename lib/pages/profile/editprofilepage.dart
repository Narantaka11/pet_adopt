import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF4E6E6A),
        title: const Text("Edit Profile", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('lib/assets/images/person.jpg'),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.edit, size: 20, color: const Color(0xFF4E6E6A)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildProfileInput(label: "Full Name", hint: "Enter your full name", icon: Icons.person),
            const SizedBox(height: 16),
            _buildProfileInput(label: "Email", hint: "Enter your email", icon: Icons.email),
            const SizedBox(height: 16),
            _buildProfileInput(label: "Phone", hint: "Enter your phone number", icon: Icons.phone),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.check_circle),
              label: const Text("Save Changes"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4E6E6A),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInput({required String label, required String hint, required IconData icon}) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: const Color(0xFF4E6E6A)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
