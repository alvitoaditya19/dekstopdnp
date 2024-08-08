part of 'models.dart';

class InputProblemMachine {
  String email;
  String name;

  String date;
  String time;

  String laporan;
  String departemen;

  InputProblemMachine(this.email, this.name, this.date, this.time, this.laporan,
      this.departemen);

  factory InputProblemMachine.fromJson(dynamic json) {
    return InputProblemMachine(
        "${json['email']}",
        "${json['name']}",
        "${json['date']}",
        "${json['time']}",
        "${json['problem']}",
        "${json['departemen']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
        'email': email,
        'name': name,
        'date': date,
        'time': time,
        'departemen': departemen,
        'laporan': laporan,
      };
}
