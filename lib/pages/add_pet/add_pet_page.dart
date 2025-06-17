import 'package:flutter/material.dart';

class AddPetPage extends StatelessWidget {
  const AddPetPage({super.key});

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          decoration: BoxDecoration(
            color: const Color(0xFF5D8C8C),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "Add Pet",
            style: TextStyle(
              color: Colors.white60,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        foregroundColor: const Color(0xFF5D8C8C),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel("Pet Name"),
              _buildTextField(hint: "Enter pet name"),
              const SizedBox(height: 16),

              _buildLabel("Type"),
              _buildDropdown(items: const ['Cat', 'Dog', 'Bunny']),
              const SizedBox(height: 16),

              _buildLabel("Breed"),
              _buildTextField(hint: "Enter breed"),
              const SizedBox(height: 16),

              _buildLabel("Age (Years)"),
              _buildTextField(hint: "Enter age", keyboardType: TextInputType.number),
              const SizedBox(height: 16),

              _buildLabel("Location"),
              _buildTextField(hint: "Enter location"),
              const SizedBox(height: 16),

              _buildLabel("Upload Photo"),
              ElevatedButton.icon(
                onPressed: () {
                  // Tambahkan fungsi upload di sini
                },
                icon: const Icon(Icons.upload, color: Colors.white60),
                label: const Text("Upload Image"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5D8C8C),
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 32),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Tambahkan aksi simpan
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5D8C8C),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(color: Color(0xFF5D8C8C), fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildTextField({required String hint, TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white60),
        filled: true,
        fillColor: const Color(0xFF5D8C8C),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildDropdown({required List<String> items}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF5D8C8C),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonFormField<String>(
        dropdownColor: const Color(0xFF5D8C8C),
        decoration: const InputDecoration(border: InputBorder.none),
        iconEnabledColor: Colors.white,
        style: const TextStyle(color: Colors.white),
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
