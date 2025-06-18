import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Opsional → untuk animasi upload atau pet

class AddPetPage extends StatelessWidget {
  const AddPetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              Center(
                child: Lottie.asset(
                  'lib/assets/animations/addpet.json', // atau ganti dengan Image.asset()
                  height: 150,
                ),
              ),
              const SizedBox(height: 20),
              _buildLabel("Pet Name"),
              _buildTextField(hint: "Enter pet name", icon: Icons.pets),
              const SizedBox(height: 16),

              _buildLabel("Type"),
              _buildDropdown(items: const ['Cat', 'Dog', 'Bunny']),
              const SizedBox(height: 16),

              _buildLabel("Breed"),
              _buildTextField(hint: "Enter breed", icon: Icons.category),
              const SizedBox(height: 16),

              _buildLabel("Age (Years)"),
              _buildTextField(hint: "Enter age", keyboardType: TextInputType.number, icon: Icons.cake),
              const SizedBox(height: 16),

              _buildLabel("Location"),
              _buildTextField(hint: "Enter location", icon: Icons.location_on),
              const SizedBox(height: 16),

              _buildLabel("Upload Photo"),
              ElevatedButton.icon(
                onPressed: () {
                  // Tambahkan fungsi upload di sini
                },
                icon: const Icon(Icons.upload, color: Colors.white),
                label: const Text("Upload Image"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4E6E6A),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  // Tambahkan aksi simpan
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4E6E6A),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Submit", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '🐾 Add New Pet',
            style: TextStyle(
              color: const Color(0xFF4E6E6A),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Fill in the details below to list your pet.',
            style: TextStyle(
              color: const Color(0xFF4E6E6A),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF4E6E6A),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    required IconData icon,
  }) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.teal[700]),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildDropdown({required List<String> items}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonFormField<String>(
        dropdownColor: Colors.white,
        decoration: const InputDecoration(border: InputBorder.none),
        iconEnabledColor: Colors.teal,
        style: const TextStyle(color: Color(0xFF4E6E6A), fontWeight: FontWeight.w500),
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
        onChanged: (value) {},
      ),
    );
  }
}
