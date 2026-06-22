import 'package:flutter/material.dart';

void main() {
  runApp(const KakeyoApp());
}

class KakeyoApp extends StatelessWidget {
  const KakeyoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kakeyo Kanji',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E5AA8),
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const Color primaryBlue = Color(0xFF5F91F2);
  static const Color darkBlue = Color(0xFF1557A6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'KAKEYO',
                  style: TextStyle(
                    fontSize: 54,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 2,
                    shadows: [
                      Shadow(
                        offset: Offset(3, 3),
                        blurRadius: 0,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'KANJI',
                  style: TextStyle(
                    fontSize: 34,
                    color: Colors.black,
                    letterSpacing: 5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 90),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFEFEF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'nama pengguna',
                          hintStyle: const TextStyle(
                            fontSize: 22,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'sandi',
                          hintStyle: const TextStyle(
                            fontSize: 22,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      const SizedBox(height: 22),
                      SizedBox(
                        width: 170,
                        height: 58,
                        child: ElevatedButton(
                          onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const MateriPage(),
    ),
  );
},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFCFCFCF),
                            foregroundColor: Colors.black,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(color: Colors.black54),
                            ),
                          ),
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'serif',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MateriPage extends StatelessWidget {
  const MateriPage({super.key});

  static const Color primaryBlue = Color(0xFF1557A6);

  final List<String> kanjiList = const [
    '新','古','長','短','高','安','低','暗','多','少'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: primaryBlue,
        title: const Text(
          'MATERI 1',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: kanjiList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => KanjiDetailPage(
          kanji: kanjiList[index],
        ),
      ),
    );
  },
  child: Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey),
    ),
    child: Center(
      child: Text(
        kanjiList[index],
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
);
          },
        ),
      ),
    );
  }
}

class KanjiDetailPage extends StatelessWidget {
  final String kanji;

  const KanjiDetailPage({super.key, required this.kanji});

  static const Color primaryBlue = Color(0xFF1557A6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: primaryBlue,
        title: const Text(
          'DETAIL KANJI',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                kanji,
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),

            const Text('[音] Onyomi',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('シン'),
            const SizedBox(height: 16),

            const Text('[訓] Kunyomi',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('あたらしい'),
            const SizedBox(height: 16),

            const Text('[意味] Arti',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Baru'),
            const SizedBox(height: 16),

            const Text('[例] Contoh',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('新しい（あたらしい） - baru'),
          ],
        ),
      ),


      
    );
  }
}