import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../model/user_request.dart';

class FirebaseService {
  static const String FIRABASE_AUTH_URL =
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDnvQiLETSK1rxjPHB2TxJaFM4n_P2gl6A";
  Future PostSpotify(SpotifyRequest request) async {
    var jsonModel = json.encode(request.toJson());
    final response = await http.post(Uri.parse(FIRABASE_AUTH_URL));
    switch (response.statusCode) {
      case HttpStatus.ok:
        return true;

      default:
        return false;
    }
  }
}
