import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

import '../models/kanji.dart';
import '../theme/app_colors.dart';

class QuizKakiScreen extends StatefulWidget {
  final Kanji kanji;

  const QuizKakiScreen({
    super.key,
    required this.kanji,
  });

  @override
  State<QuizKakiScreen> createState() => _QuizKakiScreenState();
}

class _QuizKakiScreenState extends State<QuizKakiScreen> {
  final SignatureController controller = SignatureController(
    penStrokeWidth: 4,
    penColor: Colors.black,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void clearCanvas() {
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        title: const Text(
          'KUIS : KAKI',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Text(
              widget.kanji.character,
              style: const TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Tulislah kanji ini',
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                child: Signature(
                  controller: controller,
                  backgroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: clearCanvas,
                    child: const Text('HAPUS'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Jawaban tersimpan.',
                          ),
                        ),
                      );
                    },
                    child: const Text('SELESAI'),
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