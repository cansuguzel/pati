import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pati_kampus_demo/screens/login_page.dart';
import 'package:pati_kampus_demo/screens/profile_screen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  final email = TextEditingController();
  final password = TextEditingController();
  bool visibil = true;
  bool _acceptTerms = false;

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              logo(),
              const SizedBox(height: 85),
              textfield(),
              const SizedBox(height: 10),
              textfield2(),
              const SizedBox(height: 15),
              termsCheck(),
              const SizedBox(height: 10),
              signIN(),
              const SizedBox(height: 5),
              googleSignInButton(),
              const SizedBox(height: 25),
              have(),
            ],
          ),
        ),
      ),
    );
  }

  Widget googleSignInButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const Text(
            'ya da',
            style: TextStyle(color: Color.fromARGB(156, 0, 0, 0), fontSize: 14),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(142, 0, 0, 0).withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                // Google sign-in 
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(5),
                shape: const CircleBorder(),
              ),
              child: Image.asset(
                'assets/google_asset.png', 
                width: 50, 
                height: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding signIN() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProfileScreen()), // LoginPage'e yönlendiriyor
          );
        },
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
                'Hesap Oluştur!',
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

  Padding have() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Zaten Hesabın Var mı?  ",
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        LoginPage()), // LoginPage'e yönlendiriyor
              );
            },
            child: const Text(
              "Giriş Yap!",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Padding textfield() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          style: const TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
          controller: email,
          focusNode: _focusNode1,
          decoration: InputDecoration(
            hintText: 'E-posta',
            prefixIcon: Icon(
              Icons.email_outlined,
              color: _focusNode1.hasFocus
                  ? const Color.fromARGB(100, 0, 0, 0) // Daha açık ton
                  : const Color.fromARGB(50, 0, 0, 0), 
              size: 24,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Color.fromARGB(95, 0, 0, 0),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                width: 1,
                color: Color.fromARGB(69, 0, 0, 0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding textfield2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          style: const TextStyle(
              fontSize: 15, color: Color.fromARGB(200, 0, 0, 0)),
          controller: password,
          focusNode: _focusNode2,
          obscureText: visibil,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  visibil = !visibil;
                });
              },
              child: Icon(
                visibil ? Icons.visibility_off : Icons.visibility,
                color: _focusNode2.hasFocus
                    ? const Color.fromARGB(100, 0, 0, 0) // Daha açık ton
                    : const Color.fromARGB(50, 0, 0, 0), // Daha açık ton
                size: 24,
              ),
            ),
            hintText: 'Şifre',
            prefixIcon: Icon(
              Icons.lock_outline,
              color: _focusNode2.hasFocus
                  ? const Color.fromARGB(100, 0, 0, 0) // Daha açık ton
                  : const Color.fromARGB(50, 0, 0, 0), // Daha açık ton
              size: 24,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Color.fromARGB(121, 26, 25, 25),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                width: 2,
                color: Color.fromARGB(69, 0, 0, 0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding logo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Image.asset('assets/patikampüs_yazi.png'),
    );
  }

  Widget termsCheck() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: _acceptTerms,
            onChanged: (value) => setState(() => _acceptTerms = value!),
            activeColor: const Color.fromARGB(255, 40, 240, 0),
            checkColor: Colors.white,
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                  height: 1.4,
                ),
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: 'Kullanım Koşulları',
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Şartların kullanımı sayfasına git
                      },
                  ),
                  const TextSpan(text: ' ve '),
                  TextSpan(
                    text: 'Gizlilik Politikası',
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Gizlilik politikası sayfasına git
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}