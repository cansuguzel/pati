import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pati_kampus_demo/screens/sign_up_page.dart';

class PinScreen extends StatefulWidget {
  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  String pin = "";
  bool showOverlay = false;

  void _onKeyboardTap(String value) {
    if (pin.length < 4) {
      setState(() {
        pin += value;
      });
    }
  }

  void _onBackspace() {
    if (pin.isNotEmpty) {
      setState(() {
        pin = pin.substring(0, pin.length - 1);
      });
    }
  }

  void _showProcessingOverlay() {
    setState(() {
      showOverlay = true;
    });

    Timer(const Duration(seconds: 3), () {
      setState(() {
        showOverlay = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignUpPage()),
      );
    });
  }
@override
Widget build(BuildContext context) {
  return Stack(
    children: [
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text("Yeni Pin Oluştur"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Hesabınızı Daha Güvenli Hale Getirmek İçin Pin Ekleyin",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Color.fromARGB(123, 0, 0, 0)),
              ),
              const SizedBox(height: 20),
              _buildPinInput(),
              const SizedBox(height: 30),
              _buildContinueButton(),
              const SizedBox(height: 30),
              _buildNumberPad(),
            ],
          ),
        ),
      ),
      if (showOverlay) _buildProcessingOverlay(), // Overlay en üste gelecek
    ],
  );
}


  Widget _buildPinInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 60,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(215, 0, 0, 0).withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            index < pin.length ? "*" : "",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }),
    );
  }

  Widget _buildContinueButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: ElevatedButton(
        onPressed: pin.length == 4 ? _showProcessingOverlay : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFBAE6FF),
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Devam Et',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(175, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberPad() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.6,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        if (index == 9) {
          return const SizedBox.shrink();
        }
        if (index == 11) {
          return IconButton(
            icon: const Icon(Icons.backspace, size: 28),
            onPressed: _onBackspace,
          );
        }

        String number = (index == 10) ? "0" : "${index + 1}";
        return TextButton(
          onPressed: () => _onKeyboardTap(number),
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10),
          ),
          child: Text(
            number,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(164, 0, 0, 0)),
          ),
        );
      },
    );
  }
Widget _buildProcessingOverlay() {
  return Positioned.fill( // Tüm ekranı kaplamasını sağlar
    child: Container(
      color: Colors.black.withOpacity(0.5),
      child: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width * 0.07, 
            top: MediaQuery.of(context).size.height * 0.3, 
            child: Image.asset(
              'assets/PROCESS.png',
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.9,
            ),
          ),
        ],
      ),
    ),
  );
}


}


