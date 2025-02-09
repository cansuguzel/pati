import 'package:flutter/material.dart';
import 'package:pati_kampus_demo/screens/sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool visibil = true;
  bool _rememberMe = false;
  bool _isLoading = false;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
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
              const SizedBox(height: 5),
              rememberForgotRow(),
              const SizedBox(height: 10),
              signIN(),
              if (_isLoading) ...[
                const SizedBox(height: 10),
                const CircularProgressIndicator()
              ],
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
                // Google ile giriş fonksiyonu
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
        onPressed: () async {
          if (email.text.isEmpty || password.text.isEmpty) {
            _dialogBuilder(context, "Lütfen tüm alanları doldurun");
            return;
          }

          setState(() => _isLoading = true);

          await Future.delayed(const Duration(seconds: 2));

          setState(() => _isLoading = false);
          // Başarılı giriş sonrası yönlendirme
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFBAE6FF),
          padding: const EdgeInsets.symmetric(vertical: 8),
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
                'Giriş Yap',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(164, 0, 0, 0),
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

  Padding have() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hesabın Yok Mu?  ",
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupPage()),
              );
            },
            child: const Text(
              "Oluştur!",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textfield() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: email,
        decoration: InputDecoration(
          hintText: 'E-posta',
          prefixIcon: const Icon(Icons.email_outlined,
              color: Color.fromARGB(95, 7, 1, 1)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color.fromARGB(150, 0, 0, 0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color.fromARGB(150, 0, 0, 0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
                color: Color.fromARGB(109, 0, 0, 0),
                width: 2), // Daha koyu ve belirgin
          ),
        ),
      ),
    );
  }

  Widget textfield2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: password,
        obscureText: visibil,
        decoration: InputDecoration(
          hintText: 'Şifre',
          prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
          suffixIcon: IconButton(
            icon: Icon(visibil ? Icons.visibility_off : Icons.visibility),
            onPressed: () => setState(() => visibil = !visibil),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color.fromARGB(150, 0, 0, 0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color.fromARGB(150, 0, 0, 0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
                color: Color.fromARGB(103, 0, 0, 0),
                width: 2), // Daha belirgin siyah
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Image.asset('assets/patikampüs_yazi.png'),
    );
  }

  Widget rememberForgotRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: _rememberMe,
                onChanged: (value) => setState(() => _rememberMe = value!),
                activeColor: Colors.green,
              ),
              const Text("Beni hatırla"),
            ],
          ),
          TextButton(
            onPressed: () {
              // Şifremi unuttum işlevi
            },
            child: const Text(
              "Şifremi unuttum",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, String message) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Hata',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          content: Text(message, style: const TextStyle(fontSize: 17)),
          actions: <Widget>[
            TextButton(
              child: const Text('Tamam'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}

//deneme için ana sayfa yerine oluşturduğum sayfa
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ana Sayfa")),
      body: const Center(
        child: Text(
          "Giriş Başarılı! Ana Sayfadasınız ",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}