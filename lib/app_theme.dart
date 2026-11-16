import 'package:flutter/material.dart';

abstract final class AppColors {
  static const background = Color(0xFFFAF8F5);
  static const ink = Color(0xFF2B2420);
  static const muted = Color(0xFF8A8079);
  static const tint = Color(0xFFEFE7DF);
  static const line = Color(0xFFE9E2D9);
  static const accent = Color(0xFF3E2F26);
}

String formatRupiah(int nilai) {
  final s = nilai.toString();
  final buf = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
    buf.write(s[i]);
  }
  return 'Rp $buf';
}
