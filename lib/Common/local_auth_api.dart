import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      debugPrint("Auth error ${e.toString()}");
      return false;
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;

    try {
      return await _auth.authenticate(
          androidAuthStrings:
              const AndroidAuthMessages(signInTitle: 'Authentication Required'),
          localizedReason: 'Scan Face or FingerPrint to Authenticate');
    } on PlatformException catch (e) {
      debugPrint("Auth error ${e.toString()}");
      return false;
    }
  }
}
