part of 'models.dart';

class ChecklistMesinModel {
  String departemen;
  String section;
  String mesin;
  String petugas;
  List<String> temuan; // Change type to List<String>
  String open;
  String keterangan;

  ChecklistMesinModel(
    this.departemen,
    this.section,
    this.mesin,
    this.petugas,
    this.temuan,
    this.open,
    this.keterangan,
  );

  factory ChecklistMesinModel.fromJson(dynamic json) {
    return ChecklistMesinModel(
        "${json['departemen']}",
        "${json['section']}",
        "${json['mesin']}",
        "${json['petugas']}",
        List<String>.from(json['temuan']), // Convert 'temuan' to List<String>
        "${json['open']}",
        "${json['keterangan']}");
  }

  // Method to convert the object to a map.
  Map<String, dynamic> toJson() => {
        'departemen': departemen,
        'section': section,
        'mesin': mesin,
        'petugas': petugas,
        'temuan': temuan, // Serialize List<String>
        'open': open,
        'keterangan': keterangan,
      };
}
