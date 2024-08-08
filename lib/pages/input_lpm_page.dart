// Import statements

part of 'pages.dart';

class InputLPMPage extends StatefulWidget {
  InputLPMPage({Key? key}) : super(key: key);

  @override
  _InputLPMPageState createState() => _InputLPMPageState();
}

class _InputLPMPageState extends State<InputLPMPage> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  final TextEditingController noController = TextEditingController();
  final TextEditingController tahunController = TextEditingController();
  final TextEditingController bulanController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController weekController = TextEditingController();

  final TextEditingController departemenController = TextEditingController();
  final TextEditingController sectionController = TextEditingController();
  final TextEditingController mesinController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController masalahController = TextEditingController();
  final TextEditingController tindakanController = TextEditingController();
  final TextEditingController mulaiController = TextEditingController();
  final TextEditingController selesaiController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController petugasController = TextEditingController();
  final TextEditingController groupController = TextEditingController();
  String selectedDepart = 'KR-C';
  String selectedGruop = 'NON SHIFT';
  String selectedStatus = 'TIDAK GANGGU';
  String selectedSection = 'K-INFLATION';
  String selectedMesin = 'KINF-1';
  String selectedPetugas = 'Eka';

  final CollectionReference sectionCollection =
      FirebaseFirestore.instance.collection('section');

  final CollectionReference mesinCollection =
      FirebaseFirestore.instance.collection('mesin');

  late DateTime currentDate;
  late DateTime currentStartTime;
  late DateTime currentFinishTime;
  bool isLoading = false;
  late List<String> mesinOptions;
  late List<String> sectionOptions;
  late List<String> petugasOptions;

  void _submitForm() {
    // Existing form submission logic
    // ...
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _fetchDataMesin() {
    sectionCollection.doc('FPEBkd4iU5G8Nq3vwJBS').get().then((docSnapshot) {
      if (docSnapshot.exists) {
        // Assuming "name" is the field containing the section names
        List<String> mesins = List<String>.from(docSnapshot['name']);
        print("kaksksa ");

        print("section $mesins");

        setState(() {
          mesinOptions = mesins.toSet().toList(); // Remove duplicates
        });

        print('selectionOptions : $mesinOptions');
      } else {
        print('Document does not exist');
      }
    });
  }

  void _fetchPetugasData() {
    FirebaseFirestore.instance.collection('users').get().then((querySnapshot) {
      List<String> tempPetugasList = [];
      for (var doc in querySnapshot.docs) {
        tempPetugasList.add(doc['name']);
      }
      tempPetugasList.sort(); // Mengurutkan daftar petugas secara alfabetis

      setState(() {
        petugasOptions = tempPetugasList;
        selectedPetugas = "Eka";
      });

      print('petugas : $petugasOptions');
    });
  }

  void _fetchDataMesinFirebase(
      String department, String initialMesin, String initialSection) {
    // Use the selected department to determine the field name in the document
    String fieldName = '';

    switch (department) {
      case 'KR-A':
        fieldName = 'kra';
        break;
      case 'KR-B':
        fieldName = 'krb';
        break;
      case 'KR-C':
        fieldName = 'krc';
        break;
      case 'KR-D':
        fieldName = 'krd';
        break;
      case 'FACILITY':
        fieldName = 'facility';
        break;
      case 'K-TEKNIK':
        fieldName = 'lain';
        break;

      // Add cases for other departments if needed

      default:
        fieldName = 'krc';
    }

    mesinCollection.doc('mesin').get().then((docSnapshot) {
      if (docSnapshot.exists) {
        // Assuming "name" is the field containing the section names
        List<String> mesins = List<String>.from(docSnapshot[fieldName]);
        print("kaksksa ");
        print("section $mesins");

        setState(() {
          mesinOptions = mesins.toSet().toList(); // Remove duplicates
          selectedMesin = initialMesin;
        });

        print('selectionOptions : $mesinOptions');
      } else {
        print('Document does not exist');
      }
    });

    sectionCollection.doc('section').get().then((docSnapshot) {
      if (docSnapshot.exists) {
        // Assuming "name" is the field containing the section names
        List<String> sections = List<String>.from(docSnapshot[fieldName]);
        print("kaksksa ");

        print("section $sections");

        setState(() {
          sectionOptions = sections.toSet().toList(); // Remove duplicates
          selectedSection = initialSection;
        });

        print('MESINNNNNNNN : $sectionOptions');
      } else {
        print('Document does not exist');
      }
    });
  }

  String getInitialMesinForDepartment(String department) {
    switch (department) {
      case 'KR-A':
        return 'KGR-701';
      case 'KR-B':
        return 'KBC-1';
      case 'KR-C':
        return 'KINF-1';
      case 'KR-D':
        return 'KEC-1';
      case 'FACILITY':
        return 'BOILER';
      case 'K-TEKNIK':
        return 'LAIN-LAIN';
      // Add cases for other departments if needed

      default:
        return 'KINF-1';
    }
  }

  String getInitialMesinForSection(String section) {
    switch (section) {
      case 'KR-A':
        return 'K-PRINTING';
      case 'KR-B':
        return 'K-BC';
      case 'KR-C':
        return 'K-INFLATION';
      case 'KR-D':
        return 'K-EC';
      case 'FACILITY':
        return 'FACILITY';
      case 'K-TEKNIK':
        return 'LAIN-LAIN';
      // Add cases for other departments if needed

      default:
        return 'K-INFLATION';
    }
  }

  void _fetchDataSection() {
    sectionCollection.doc('TYtHMw5n5lKvH4juIG8M').get().then((docSnapshot) {
      if (docSnapshot.exists) {
        // Assuming "name" is the field containing the section names
        List<String> sections = List<String>.from(docSnapshot['name']);
        print("kaksksa ");

        print("section $sections");

        setState(() {
          sectionOptions = sections.toSet().toList(); // Remove duplicates
        });

        print('MESINNNNNNNN : $sectionOptions');
      } else {
        print('Document does not exist');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    currentDate = DateTime.now();
    currentStartTime = DateTime.now();
    currentFinishTime = DateTime.now();
    mesinOptions = []; // Initialize the mesinOptions list
    sectionOptions = []; // Initialize the sectionOptions list
    petugasOptions = [];

    _fetchDataMesinFirebase('KR-C', 'KINF-1', 'K-INFLATION');
    _fetchDataSection();
    _fetchPetugasData(); // Fetch petugas data from Firestore
  }

  Widget buildDropDownButton(
      List<String> items, String label, String selectedValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: blackTextStyle.copyWith(fontWeight: semiBold),
        ),
        SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: selectedValue,
          style: blackTextStyle,
          onChanged: (String? value) {
            setState(() {
              if (label == 'Departemen') {
                selectedDepart = value!;
              } else if (label == 'Section') {
                selectedSection = value!;
              } else if (label == 'Mesin') {
                selectedMesin = value!;
              } else if (label == 'Status') {
                selectedStatus = value!;
              } else if (label == 'Group') {
                selectedGruop = value!;
              } else if (label == 'Petugas') {
                selectedPetugas = value!;
              }
            });
          },
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: InputDecoration(
            hintText: 'Pilih $label',
            hintStyle: blackTextStyle.copyWith(
              fontSize: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                defaultRadius,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                defaultRadius,
              ),
              borderSide: BorderSide(
                width: 2,
                color: blueColor,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }

  Widget buildDropDownButtonMesin(List<String> items, String label,
      String selectedValue, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: blackTextStyle.copyWith(fontWeight: semiBold),
        ),
        SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: selectedValue,
          style: blackTextStyle,
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: InputDecoration(
            hintText: 'Pilih $label',
            hintStyle: blackTextStyle.copyWith(
              fontSize: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                defaultRadius,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                defaultRadius,
              ),
              borderSide: BorderSide(
                width: 2,
                color: blueColor,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }

  Widget buildTextField({
    bool hasSuggestions = false,
    required String labelText,
    required TextEditingController controller,
    required bool readOnly,
    required TextInputType keyboardType,
    bool isMultiline = false,
    String? initialValue,
    bool hasDateOrTimePicker = false,
    IconData? iconButtonIcon, // Paameter baru untuk ikon kustom pada IconButton
    String? hintText,
    Function(String)? onChanged,
    Function()? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: blackTextStyle.copyWith(fontWeight: semiBold),
        ),
        SizedBox(height: 6),
        isMultiline
            ? TextFormField(
                controller: controller,
                readOnly: readOnly,
                keyboardType: keyboardType,
                onChanged: onChanged,
                onTap: onTap,
                maxLines: null,
                style: blackTextStyle,
                decoration: InputDecoration(
                  hintText: hintText ?? labelText,
                  hintStyle: greyTextStyle.copyWith(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(width: 2, color: blueColor),
                  ),
                ),
              )
            : Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      readOnly: readOnly,
                      keyboardType: keyboardType,
                      onChanged: onChanged,
                      onTap: onTap,
                      style: blackTextStyle,
                      decoration: InputDecoration(
                        hintText: hintText ?? labelText,
                        hintStyle: readOnly
                            ? blackTextStyle.copyWith(fontSize: 16)
                            : greyTextStyle.copyWith(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(defaultRadius),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          borderSide: BorderSide(width: 2, color: blueColor),
                        ),
                      ),
                    ),
                  ),
                  if (hasDateOrTimePicker) ...[
                    SizedBox(width: 10),
                    IconButton(
                      onPressed: onTap as void Function()?,
                      icon: Icon(iconButtonIcon ??
                          Icons
                              .access_time), // Gunakan ikon kustom jika diset, jika tidak gunakan ikon waktu
                    ),
                  ],
                ],
              ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }

  int getWeekNumber(DateTime date) {
    final startOfYear = DateTime(date.year, 1, 1);
    final firstMonday =
        startOfYear.add(Duration(days: (8 - startOfYear.weekday) % 7));

    final days = date.difference(firstMonday).inDays;
    final weekNumber = (days / 7).ceil();

    return weekNumber;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToMainPage());

        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: blueColor,
            leading: GestureDetector(
              child: Icon(
                Icons.arrow_back_ios,
                color: whiteColor,
              ),
              onTap: () {
                context.read<PageBloc>().add(GoToMainPage());
              },
            ),
            title: Text(
              "Input LPM",
              style:
                  whiteTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child:
                    BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                  if (sectionOptions == [] || mesinOptions == []) {
                    // Data is still loading, show loading spinner
                    return Center(
                      child: SpinKitFadingCircle(
                        color: blueColor,
                        size: 50,
                      ),
                    );
                  } else {
                    return Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          // buildTextField(
                          //   labelText: 'Tahun',
                          //   controller: tahunController,
                          //   keyboardType: TextInputType.number,
                          //   readOnly: false,
                          // ),
                          // buildTextField(
                          //   labelText: 'Bulan',
                          //   controller: bulanController,
                          //   readOnly: false,
                          //   keyboardType: TextInputType.number,
                          // ),
                          buildTextField(
                            labelText: 'Tanggal',
                            controller: tanggalController,
                            readOnly: false,
                            hasDateOrTimePicker: true,
                            onTap: () async {
                              final DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: currentDate,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101),
                              );

                              if (pickedDate != null &&
                                  pickedDate != currentDate) {
                                setState(() {
                                  currentDate = pickedDate;
                                  tanggalController.text =
                                      '${currentDate.day}/${currentDate.month}/${currentDate.year}';

                                  // Menggunakan fungsi getWeekNumber untuk mendapatkan minggu
                                  int weekNumber = getWeekNumber(currentDate);
                                  weekController.text = '$weekNumber';

                                  tahunController.text = '${currentDate.year}';
                                  bulanController.text = '${currentDate.month}';
                                });
                              }
                            },
                            keyboardType: TextInputType.text,
                            iconButtonIcon: Icons.calendar_today,
                          ),
                          buildDropDownButtonMesin(
                            [
                              'KR-A',
                              'KR-B',
                              'KR-C',
                              'KR-D',
                              'FACILITY',
                              'K-TEKNIK'
                            ],
                            'Departemen',
                            selectedDepart,
                            (String? value) {
                              setState(() {
                                selectedDepart = value!;
                                String initialMesin =
                                    getInitialMesinForDepartment(
                                        selectedDepart);
                                String initialSection =
                                    getInitialMesinForSection(selectedDepart);
                                _fetchDataMesinFirebase(selectedDepart,
                                    initialMesin, initialSection);
                              });
                            },
                          ),
                          buildDropDownButton(
                              sectionOptions, 'Section', selectedSection),
                          buildDropDownButton(
                              mesinOptions, 'Mesin', selectedMesin),
                          buildTextField(
                            labelText: 'Unit',
                            controller: unitController,
                            readOnly: false,
                            keyboardType: TextInputType.text,
                          ),
                          buildTextField(
                            labelText: 'Masalah',
                            controller: masalahController,
                            readOnly: false,
                            isMultiline: true,
                            keyboardType: TextInputType.text,
                          ),

                          buildTextField(
                            labelText: 'Tindakan',
                            controller: tindakanController,
                            readOnly: false,
                            isMultiline: true,
                            keyboardType: TextInputType.text,
                          ),
                          buildTextField(
                            labelText: 'Mulai',
                            controller: mulaiController,
                            readOnly: false,
                            hasDateOrTimePicker: true,
                            keyboardType: TextInputType.text,
                            onTap: () async {
                              // Fungsi untuk menangani revisi waktu
                              final TimeOfDay? pickedTime =
                                  await showTimePicker(
                                context: context,
                                initialTime:
                                    TimeOfDay.fromDateTime(currentStartTime),
                              );

                              if (pickedTime != null) {
                                setState(() {
                                  currentStartTime = DateTime(
                                    pickedTime.hour,
                                    pickedTime.minute,
                                    0,
                                  );
                                  mulaiController.text =
                                      '${pickedTime.hour}:${pickedTime.minute}:00';
                                });
                              }
                            },
                          ),
                          buildTextField(
                            labelText: 'Selesai',
                            controller: selesaiController,
                            readOnly: false,
                            hasDateOrTimePicker: true,
                            keyboardType: TextInputType.text,
                            onTap: () async {
                              // Fungsi untuk menangani revisi waktu
                              final TimeOfDay? pickedTime =
                                  await showTimePicker(
                                context: context,
                                initialTime:
                                    TimeOfDay.fromDateTime(currentFinishTime),
                              );

                              if (pickedTime != null) {
                                setState(() {
                                  currentFinishTime = DateTime(
                                    pickedTime.hour,
                                    pickedTime.minute,
                                    0,
                                  );
                                  selesaiController.text =
                                      '${pickedTime.hour}:${pickedTime.minute}:00';
                                });
                              }
                            },
                          ),
                          buildDropDownButton(
                              ['GANGGU', 'TIDAK GANGGU', 'TPM/RPM'],
                              'Status',
                              selectedStatus),

                          buildDropDownButton(
                              petugasOptions, 'Petugas', selectedPetugas),
                          buildDropDownButton([
                            'NON SHIFT',
                            'SHIFT A',
                            'SHIFT B',
                            'SHIFT C',
                            'SHIFT D'
                          ], 'Group', selectedGruop),
                          SizedBox(height: 16),
                          SizedBox(
                            height: 55,
                            width: double.infinity,
                            child: isLoading
                                ? SpinKitFadingCircle(
                                    color: blueColor,
                                    size: 80.0,
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: blueColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            defaultRadius),
                                      ),
                                    ),
                                    onPressed: isLoading
                                        ? null
                                        : () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              if (tahunController.text.isEmpty ||
                                                  bulanController
                                                      .text.isEmpty ||
                                                  tanggalController
                                                      .text.isEmpty ||
                                                  weekController.text.isEmpty ||
                                                  unitController.text.isEmpty ||
                                                  masalahController
                                                      .text.isEmpty ||
                                                  tindakanController
                                                      .text.isEmpty ||
                                                  mulaiController
                                                      .text.isEmpty ||
                                                  selesaiController
                                                      .text.isEmpty) {
                                                _showErrorFlushbar(context,
                                                    "Tolong isi semua data!!!");
                                              } else {
                                                setState(() {
                                                  isLoading =
                                                      true; // Menampilkan loading indicator
                                                });
                                                InputLPMModel inputLPMModel =
                                                    InputLPMModel(
                                                  tahunController.text,
                                                  bulanController.text,
                                                  weekController.text,
                                                  tanggalController.text,
                                                  selectedDepart,
                                                  selectedSection,
                                                  selectedMesin,
                                                  unitController.text,
                                                  masalahController.text,
                                                  tindakanController.text,
                                                  mulaiController.text,
                                                  selesaiController.text,
                                                  selectedStatus,
                                                  selectedPetugas,
                                                  selectedGruop,
                                                );

                                                LPMService lpmService =
                                                    LPMService();

                                                lpmService
                                                    .submitForm(inputLPMModel,
                                                        (String response) {
                                                  print("Response: $response");
                                                  if (response ==
                                                      FormController
                                                          .STATUS_SUCCESS) {
                                                    Flushbar(
                                                      duration:
                                                          Duration(seconds: 4),
                                                      flushbarPosition:
                                                          FlushbarPosition.TOP,
                                                      backgroundColor:
                                                          greenColor,
                                                      message:
                                                          "Laporan Telah Di Kirimkan",
                                                    )..show(context);
                                                    context
                                                        .read<PageBloc>()
                                                        .add(GoToMainPage());
                                                  } else {
                                                    Flushbar(
                                                      duration:
                                                          Duration(seconds: 4),
                                                      flushbarPosition:
                                                          FlushbarPosition.TOP,
                                                      backgroundColor:
                                                          greenColor,
                                                      message:
                                                          "Input Data Error",
                                                    )..show(context);
                                                  }
                                                });
                                              }
                                            }
                                          },
                                    child: Text(
                                      'Input Laporan',
                                      style: whiteTextStyle.copyWith(
                                        fontWeight: medium,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    );
                  }
                })),
          ),
        ),
      ),
    );
  }
}

void _showErrorFlushbar(BuildContext context, String message) {
  final errorFlushbar = Flushbar(
    duration: Duration(seconds: 4),
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    message: message,
  )..show(context);
}
