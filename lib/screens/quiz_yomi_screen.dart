import 'package:flutter/material.dart';
import '../models/kanji.dart';
import '../theme/app_colors.dart';

class QuizYomiScreen extends StatefulWidget {
  final Kanji kanji;

  const QuizYomiScreen({
    super.key,
    required this.kanji,
  });

  @override
  State<QuizYomiScreen> createState() => _QuizYomiScreenState();
}

class _QuizYomiScreenState extends State<QuizYomiScreen> {
  final TextEditingController answerController = TextEditingController();

  String? resultMessage;
  bool? isCorrect;

  void checkAnswer() {
    final userAnswer = answerController.text.trim();
    final kunyomiAnswer = widget.kanji.kunyomi.trim();
    final onyomiAnswer = widget.kanji.onyomi.trim();

    setState(() {
      if (userAnswer == kunyomiAnswer || userAnswer == onyomiAnswer) {
        isCorrect = true;
        resultMessage = 'Benar!';
      } else {
        isCorrect = false;
        resultMessage =
            'Belum tepat. Jawaban: ${widget.kanji.kunyomi} / ${widget.kanji.onyomi}';
      }
    });
  }

  @override
  void dispose() {
    answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color resultColor =
        isCorrect == true ? Colors.green : Colors.red;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        title: const Text(
          'KUIS : YOMI',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              widget.kanji.character,
              style: const TextStyle(
                fontSize: 88,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Masukkan cara baca kanji ini',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: answerController,
              decoration: const InputDecoration(
                hintText: 'Contoh: あたらしい / シン',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              onSubmitted: (_) => checkAnswer(),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: checkAnswer,
                child: const Text(
                  'JAWAB',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            if (resultMessage != null) ...[
              const SizedBox(height: 24),
              Text(
                resultMessage!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: resultColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}