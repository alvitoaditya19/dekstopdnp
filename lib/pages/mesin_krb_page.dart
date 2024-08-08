part of 'pages.dart';

class MesinKRBPage extends StatefulWidget {
  const MesinKRBPage({super.key});

  @override
  State<MesinKRBPage> createState() => _MesinKRBPageState();
}

class _MesinKRBPageState extends State<MesinKRBPage> {
  @override
  Widget build(BuildContext context) {
    Future<void> _showStatusAlertDialog() async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Mesin Masalah!!!!',
                style: redTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                )),
            content:
                Text('Do you want to go to the patient location directly??',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    )),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'No',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  'Yes',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                onPressed: () {
                  context.read<PageBloc>().add(GoToMainPage());
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToMainPage());

        return false;
      },
      child: Scaffold(
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
              "DNP Indonesia",
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            )),
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(blueColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ))),
                    child: Container(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Ubah Kondisi Mesin',
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      context.read<PageBloc>().add(GoToMesinKRBPage());
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                color: greenColor,
                                borderRadius: BorderRadius.circular(16)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Mesin KBMTS-11',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: _showStatusAlertDialog,
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: redColor,
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Mesin KBMTS-9',
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                color: greenColor,
                                borderRadius: BorderRadius.circular(16)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Mesin KBMTS-6',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                color: redColor,
                                borderRadius: BorderRadius.circular(16)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Mesin KBMPC-7',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                    ],
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
