import 'package:flutter/material.dart';

class AppColors {
  static final background = Color(0xFFFAF8F5);
  static final ink = Color(0xFF2B2420);
  static final muted = Color(0xFF8A8079);
  static final tint = Color(0xFFEFE7DF);
  static final line = Color(0xFFE9E2D9);
  static final accent = Color(0xFF3E2F26);
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
