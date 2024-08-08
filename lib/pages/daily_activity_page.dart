part of 'pages.dart';

class DailyActivityPage extends StatefulWidget {
  DailyActivityPage({Key? key}) : super(key: key);

  @override
  _DailyActivityPageState createState() => _DailyActivityPageState();
}

class _DailyActivityPageState extends State<DailyActivityPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController departemenController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController laporanController = TextEditingController();

  String selectedKR = 'KR-A';
  late DateTime currentDate;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    currentDate = DateTime.now();
  }

  Widget buildTextFormField({
    required String label,
    required TextEditingController controller,
    required bool readOnly,
    required bool isMultiline,
    TextInputType? keyboardType,
    String? hintText,
    IconData? iconButtonIcon,
    Function(String)? onChanged,
    Function()? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
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
                  hintText: hintText ?? label,
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
                        hintText: hintText ?? label,
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
                  if (iconButtonIcon != null) ...[
                    SizedBox(width: 10),
                    IconButton(
                      onPressed: onTap as void Function()?,
                      icon: Icon(iconButtonIcon),
                    ),
                  ],
                ],
              ),
        SizedBox(height: 12),
      ],
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
              "Daily Activity",
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  BlocBuilder<UserBloc, UserState>(
                    builder: (_, userState) {
                      if (userState is UserLoaded) {
                        return Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              buildTextFormField(
                                label: 'Alamat Email',
                                hintText: userState.user.email,
                                controller: emailController,
                                readOnly: true,
                                isMultiline: false,
                                keyboardType: TextInputType.text,
                              ),
                              buildTextFormField(
                                label: 'Nama',
                                controller: nameController,
                                hintText: userState.user.name,
                                readOnly: true,
                                isMultiline: false,
                                keyboardType: TextInputType.text,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Departemen',
                                    style: blackTextStyle.copyWith(
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  DropdownButtonFormField<String>(
                                    value: selectedKR,
                                    style: blackTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                    onChanged: (String? value) {
                                      setState(() {
                                        selectedKR = value!;
                                      });
                                    },
                                    items: [
                                      'KR-A',
                                      'KR-B',
                                      'KR-C',
                                      'KR-D',
                                      'K-TEKNIK'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    decoration: InputDecoration(
                                      hintText: 'Pilih KR',
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
                                ],
                              ),
                              SizedBox(height: 16),
                              buildTextFormField(
                                label: 'Time',
                                controller: timeController,
                                hintText:
                                    '${currentDate.hour}:${currentDate.minute}:${currentDate.second}',
                                readOnly: true,
                                isMultiline: false,
                                keyboardType: TextInputType.text,
                                onTap: () async {
                                  final TimeOfDay? pickedTime =
                                      await showTimePicker(
                                    context: context,
                                    initialTime:
                                        TimeOfDay.fromDateTime(currentDate),
                                  );
    
                                  if (pickedTime != null) {
                                    setState(() {
                                      currentDate = DateTime(
                                        currentDate.year,
                                        currentDate.month,
                                        currentDate.day,
                                        pickedTime.hour,
                                        pickedTime.minute,
                                      );
                                    });
                                  }
                                },
                                iconButtonIcon: Icons.access_time,
                              ),
                              buildTextFormField(
                                label: 'Date',
                                controller: dateController,
                                readOnly: true,
                                isMultiline: false,
                                keyboardType: TextInputType.text,
                                hintText:
                                    '${currentDate.day}/${currentDate.month}/${currentDate.year}',
                                onTap: () async {
                                  final DateTime? pickedDate =
                                      await showDatePicker(
                                    context: context,
                                    initialDate: currentDate,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );
    
                                  if (pickedDate != null &&
                                      pickedDate != currentDate) {
                                    setState(() {
                                      currentDate = pickedDate;
                                      dateController.text =
                                          '${currentDate.day}/${currentDate.month}/${currentDate.year}';
                                    });
                                  }
                                },
                                iconButtonIcon: Icons.calendar_today,
                              ),
                              buildTextFormField(
                                label: 'Laporan',
                                controller: laporanController,
                                readOnly: false,
                                isMultiline: true,
                                keyboardType: TextInputType.multiline,
                                hintText: 'Laporan',
                                onChanged: (value) {
                                  // Add any specific handling for onChanged if needed
                                },
                                onTap: () {
                                  // Add any specific handling for onTap if needed
                                },
                              ),
                              SizedBox(
                                height: 16,
                              ),
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
                                              defaultRadius,
                                            ),
                                          ),
                                        ),
                                        onPressed: isLoading
                                            ? null
                                            : () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  if (laporanController
                                                      .text.isEmpty) {
                                                    _showDataErrorFlushbar(
                                                        context,
                                                        "Tolong isi semua data!!!");
                                                  } else {
                                                    setState(() {
                                                      isLoading = true;
                                                    });
                                                    InputProblemMachine
                                                        inputProblemMachine =
                                                        InputProblemMachine(
                                                      userState.user.email,
                                                      userState.user.name!,
                                                      selectedKR,
                                                      '${currentDate.day}/${currentDate.month}/${currentDate.year}',
                                                      '${currentDate.hour}:${currentDate.minute}:${currentDate.second}',
                                                      laporanController.text,
                                                    );
    
                                                    FormController
                                                        formController =
                                                        FormController();
    
                                                    // _showSnackbar(context, "Submitting Feedback");
    
                                                    formController.submitForm(
                                                        inputProblemMachine,
                                                        (String response) {
                                                      print(
                                                          "Response: $response");
                                                      if (response ==
                                                          FormController
                                                              .STATUS_SUCCESS) {
                                                        Flushbar(
                                                          duration: Duration(
                                                              seconds: 4),
                                                          flushbarPosition:
                                                              FlushbarPosition
                                                                  .TOP,
                                                          backgroundColor:
                                                              greenColor,
                                                          message:
                                                              "Laporan Telah Di Kirimkan",
                                                        )..show(context);
                                                        context
                                                            .read<PageBloc>()
                                                            .add(GoToMainPage());
                                                        // _showSnackbar(context, "Feedback Submitted");
                                                      } else {
                                                        Flushbar(
                                                          duration: Duration(
                                                              seconds: 4),
                                                          flushbarPosition:
                                                              FlushbarPosition
                                                                  .TOP,
                                                          backgroundColor:
                                                              greenColor,
                                                          message:
                                                              "Input Data Error",
                                                        )..show(context);
                                                        // _showSnackbar(context, "Error Occurred!");
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
                              SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                        );
                      } else {
                        return SpinKitFadingCircle(
                          color: blueColor,
                          size: 50,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showErrorFlushbarData(BuildContext context, String message) {
  final errorFlushbar = Flushbar(
    duration: Duration(seconds: 4),
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    message: message,
  )..show(context);
}
