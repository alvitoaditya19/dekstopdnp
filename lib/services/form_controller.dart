import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:dekstopdnp/models/models.dart';

class FormController {
  // Google App Script Web URL.
  static const String? URL =
      "https://script.google.com/macros/s/AKfycbz0KvaCWMLkk1oSjfisCHAPqmM7dUwF7QMSm6I4BFA7DJrdM-4IPTa3tqvfrBqcn12J7g/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  Future<void> submitForm(
      InputProblemMachine feedbackForm, void Function(String) callback) async {
    try {
      final response = await http.post(Uri.parse(URL!), body: feedbackForm.toJson());

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
