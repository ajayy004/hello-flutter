import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../util/constants.dart' as constants;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> _authenticate(
    String email,
    String password,
    String type,
  ) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$type?key=${constants.xApiKey}';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }),
      );
      return json.decode(response.body);
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    await _authenticate(email, password, "signUp");
  }

  Future<void> login(String email, String password) async {
    await _authenticate(email, password, 'signInWithPassword');
  }
}
