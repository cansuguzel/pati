import 'package:flutter/material.dart';
import 'package:pati_kampus_demo/screens/pin_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  String? selectedGender;
  final List<String> genders = ['Erkek', 'Kadın', 'Diğer'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profil Bilgileri', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: profilePicture()),
            const SizedBox(height: 30),
            textField(nameController, 'İsim', Icons.person),
            const SizedBox(height: 10),
            textField(surnameController, 'Soyisim', Icons.person_outline),
            const SizedBox(height: 10),
            textField(birthDateController, 'Doğum Tarihi', Icons.calendar_today, isReadOnly: true, onTap: _selectDate),
            const SizedBox(height: 10),
            textField(emailController, 'E-posta', Icons.email),
            const SizedBox(height: 10),
            genderDropdown(),
            const SizedBox(height: 40),
            continueButton(),
          ],
        ),
      ),
    );
  }

  Widget profilePicture() {
    return const CircleAvatar(
      radius: 30,
      backgroundColor: Color.fromARGB(255, 205, 205, 205),
      child: Icon(Icons.person, color: Colors.white, size: 30),
    );
  }

  Widget textField(TextEditingController controller, String hint, IconData icon, {bool isReadOnly = false, VoidCallback? onTap}) {
    return TextField(
      controller: controller,
      readOnly: isReadOnly,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: hint,
        prefixIcon: Icon(icon, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color.fromARGB(50, 0, 0, 0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color.fromARGB(50, 0, 0, 0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color.fromARGB(100, 0, 0, 0), width: 2.0),
        ),
      ),
    );
  }

  Widget genderDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Cinsiyet',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color.fromARGB(50, 0, 0, 0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color.fromARGB(50, 0, 0, 0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color.fromARGB(100, 0, 0, 0), width: 2.0),
        ),
      ),
      value: selectedGender,
      onChanged: (String? newValue) {
        setState(() {
          selectedGender = newValue;
        });
      },
      items: genders.map((String gender) {
        return DropdownMenuItem<String>(
          value: gender,
          child: Text(gender),
        );
      }).toList(),
    );
  }

  Widget continueButton() {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PinScreen()), // LoginPage'e yönlendiriyor
            );
      }, // Tıklama işlemi burada tanımlanabilir
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFBAE6FF), 
        padding: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Yuvarlak köşeler
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Ortadaki metin
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Devam Et',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(164, 0, 0, 0), // Açık siyah renk
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Sağdaki beyaz daire içinde ok
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(right: 12), // Sağdan boşluk
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Colors.white, // Beyaz renk
                shape: BoxShape.circle, // Daire şekli
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.blue, // Ok simgesinin rengi
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        birthDateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }
}
