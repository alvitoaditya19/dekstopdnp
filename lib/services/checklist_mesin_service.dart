import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dekstopdnp/models/models.dart';

class ChecklistMesinService {
  // Google App Script Web URL.
  static const String? URL =
      "https://script.google.com/macros/s/AKfycbw_BA1Qk8NobPbwLDRztzKc-LZrDWUSbVH6aGt8U082eeNScCP38RcchhGqgs5HGtahWg/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  Future<void> submitForm(
      ChecklistMesinModel feedbackForm, void Function(String) callback) async {
    try {
      // Convert 'temuan' to a JSON array string
      final temuanJson = jsonEncode(feedbackForm.temuan);

      // Build the JSON data with the modified 'temuan' field
      final jsonData = {
        'departemen': feedbackForm.departemen,
        'section': feedbackForm.section,
        'mesin': feedbackForm.mesin,
        'petugas': feedbackForm.petugas,
        'temuan': temuanJson,
        'open': feedbackForm.open,
        'keterangan': feedbackForm.keterangan,
      };

      final response = await http.post(Uri.parse(URL!), body: jsonData);

      if (response.statusCode == 302) {
        final url = response.headers['location'];
        final secondResponse = await http.get(Uri.parse(url!));
        callback(convert.jsonDecode(secondResponse.body)['status']);
      } else {
        callback(convert.jsonDecode(response.body)['status']);
      }
    } catch (e) {
      print(e);
    }
  }
}
