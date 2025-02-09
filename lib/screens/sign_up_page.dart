import 'package:flutter/material.dart';
import 'package:pati_kampus_demo/screens/login_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Spacer(flex: 3), // Üstte boşluk bırakmak için
            Text(
              'Hadi Başlayalım!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 1.25,
                textBaseline: TextBaseline.alphabetic,
                color: Color.fromARGB(121, 0, 5, 11),
              ),
              textAlign: TextAlign.center, // Ortalanmış yazı
            ),
            Spacer(), // Altta butonları alta itmek için
            // Google ile kayıt ol butonu
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  // Google ile giriş işlemi
                },
                icon: Image.asset(
                  'assets/google_asset.png', 
                  width: 50, 
                  height: 50,
                ),
                label: Text(
                  'Google ile Kayıt Ol!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey), // Kenar çizgisi
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Yuvarlak köşeler
                  ),
                ),
              ),
            ),
            SizedBox(height: 16), // Butonlar arasında boşluk
            // Giriş Yap butonu
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );

                  // Giriş yap işlemi
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFBAE6FF), // Açık mavi renk
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Yuvarlak köşeler
                  ),
                  elevation: 5, // Hafif gölge efekti
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Ortadaki metin
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'GİRİŞ YAP!',
                        style: TextStyle(
                            fontSize: 16,
                            color: const Color.fromARGB(164, 0, 0, 0)),
                      ),
                    ),
                    // Sağdaki beyaz daire içinde ok
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 12), // Sağdan boşluk
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.white, // Beyaz renk
                          shape: BoxShape.circle, // Daire şekli
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.blue, // Ok simgesinin rengi
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 70), // Alttan boşluk bırakmak için
          ],
        ),
      ),
    );
  }
}
