part of 'models.dart';

class InputLPMModel {
  String tahun;
  String bulan;
  String week;

  String tanggal;
  String departemen;
  String section;
  String mesin;
  String unit;
  String masalah;
  String tindakan;
  String mulai;
  String selesai;
  String status;
  String petugas;
  String group;

  InputLPMModel(
    this.tahun,
    this.bulan,
    this.week,
    this.tanggal,
    this.departemen,
    this.section,
    this.mesin,
    this.unit,
    this.masalah,
    this.tindakan,
    this.mulai,
    this.selesai,
    this.status,
    this.petugas,
    this.group,
  );

  factory InputLPMModel.fromJson(dynamic json) {
    return InputLPMModel(
        "${json['tahun']}",
        "${json['bulan']}",
        "${json['week']}",
        "${json['tanggal']}",
        "${json['departemen']}",
        "${json['section']}",
        "${json['mesin']}",
        "${json['unit']}",
        "${json['masalah']}",
        "${json['tindakan']}",
        "${json['mulai']}",
        "${json['selesai']}",
        "${json['status']}",
        "${json['petugas']}",
        "${json['group']}");
  }

  // Method to convert the object to a map.
  Map toJson() => {
        'tahun': tahun,
        'bulan': bulan,
        'week': week,
        'tanggal': tanggal,
        'departemen': departemen,
        'section': section,
        'mesin': mesin,
        'unit': unit,
        'masalah': masalah,
        'tindakan': tindakan,
        'mulai': mulai,
        'selesai': selesai,
        'status': status,
        'petugas': petugas,
        'group': group,
      };
}
