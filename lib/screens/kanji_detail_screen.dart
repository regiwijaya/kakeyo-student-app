import 'package:flutter/material.dart';
import '../models/kanji.dart';
import '../theme/app_colors.dart';
import 'quiz_imi_screen.dart';
import 'quiz_yomi_screen.dart';
import 'quiz_kaki_screen.dart';

class KanjiDetailScreen extends StatelessWidget {
  final Kanji kanji;

  const KanjiDetailScreen({
    super.key,
    required this.kanji,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        title: const Text(
          'DETAIL KANJI',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                kanji.character,
                style: const TextStyle(
                  fontSize: 90,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 28),
            _InfoBlock(
              label: '[音] Onyomi',
              value: kanji.onyomi,
            ),
            _InfoBlock(
              label: '[訓] Kunyomi',
              value: kanji.kunyomi,
            ),
            _InfoBlock(
              label: '[意味] Arti',
              value: kanji.meaning,
            ),
            _InfoBlock(
              label: '[例] Contoh',
              value:
                  '${kanji.exampleWord}（${kanji.exampleReading}） - ${kanji.exampleMeaning}',
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizImiScreen(kanji: kanji),
                        ),
                      );
                    },
                    child: const Text('IMI'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizYomiScreen(kanji: kanji),
                        ),
                      );
                    },
                    child: const Text('YOMI'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => QuizKakiScreen(
        kanji: kanji,
      ),
    ),
  );
},
                    child: const Text('KAKI'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  final String label;
  final String value;

  const _InfoBlock({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}