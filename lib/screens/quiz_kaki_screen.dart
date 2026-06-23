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
    penStrokeWidth: 5,
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

  void finishWriting() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Latihan tulis selesai.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        title: const Text(
          'KUIS : KAKI',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                fontSize: 76,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${widget.kanji.kunyomi} / ${widget.kanji.meaning}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 18),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black87, width: 2),
                ),
                child: Stack(
                  children: [
                    CustomPaint(
                      painter: KanjiGuidePainter(),
                      child: Container(),
                    ),
                    Signature(
                      controller: controller,
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: clearCanvas,
                    child: const Text('HAPUS'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: finishWriting,
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

class KanjiGuidePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint borderPaint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 1;

    final Paint centerPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    canvas.drawLine(
      Offset(centerX, 0),
      Offset(centerX, size.height),
      centerPaint,
    );

    canvas.drawLine(
      Offset(0, centerY),
      Offset(size.width, centerY),
      centerPaint,
    );

    canvas.drawLine(
      Offset(0, 0),
      Offset(size.width, size.height),
      borderPaint,
    );

    canvas.drawLine(
      Offset(size.width, 0),
      Offset(0, size.height),
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}