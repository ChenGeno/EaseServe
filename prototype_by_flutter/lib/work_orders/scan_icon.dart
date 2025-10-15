import 'package:flutter/material.dart';

class ScanIcon extends StatelessWidget {
  final double size;
  final Color color;

  const ScanIcon({super.key, this.size = 24, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _ScanIconPainter(color: color),
      ),
    );
  }
}

class _ScanIconPainter extends CustomPainter {
  final Color color;

  const _ScanIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = size.width * 0.12;
    final minBound = strokeWidth / 2;
    final maxBoundW = size.width - minBound;
    final maxBoundH = size.height - minBound;
    final cornerLength = size.width * 0.32;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(minBound, cornerLength)
      ..quadraticBezierTo(minBound, minBound, cornerLength, minBound)
      ..moveTo(size.width - cornerLength, minBound)
      ..quadraticBezierTo(maxBoundW, minBound, maxBoundW, cornerLength)
      ..moveTo(maxBoundW, size.height - cornerLength)
      ..quadraticBezierTo(
        maxBoundW,
        maxBoundH,
        size.width - cornerLength,
        maxBoundH,
      )
      ..moveTo(cornerLength, maxBoundH)
      ..quadraticBezierTo(
          minBound, maxBoundH, minBound, size.height - cornerLength);

    canvas.drawPath(path, paint);

    canvas.drawLine(
      Offset(size.width * 0.28, size.height / 2),
      Offset(size.width * 0.72, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
