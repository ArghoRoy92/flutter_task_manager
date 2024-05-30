import 'package:flutter/foundation.dart';

void devPrint(Object value) {
  if (kDebugMode) {
    print("[Log] - ${value.toString()}");
  }
}
