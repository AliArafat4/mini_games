import 'package:flutter/material.dart';

extension SizeExt on BuildContext {
  getWidth({double factor = 1}) {
    return MediaQuery.of(this).size.width * factor;
  }

  getHeight({double factor = 1}) {
    return MediaQuery.of(this).size.height * factor;
  }
}
