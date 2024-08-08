part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int? bottomNavBarIndex;
  final String? title;
  final url;

  MainPage({this.bottomNavBarIndex = 0, this.title, this.url});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int? bottomNavBarIndex;
  PageController? pageController;
  TextEditingController amountController = TextEditingController(text: 'Rp. 0');
  int selectedAmount = 0;

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 40) / 4;

    Widget header() {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: blueColor,
                        width: 3,
                      ),
                      image: DecorationImage(
                          // image: DecorationImage( image: true ? NetworkImage('someNetWorkLocation.com') : AssetImage('assets/images/noImageAvailable.png') as ImageProvider ),
                          image: AssetImage("assets/user_pic.png")
                              as ImageProvider,
                          fit: BoxFit.cover)),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hai, Teknik Team',
                        style: blackTextStyle.copyWith(
                            fontWeight: medium, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      // Text(
                      //  '${userState.user.balance ?? "0"}',
                      //   style: blackTextStyle.copyWith(fontSize: 14),
                      //   maxLines: 1,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                      Text(
                        'Team',
                        style: blackTextStyle.copyWith(fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 54,
                width: 54,
                padding: EdgeInsets.only(left: 6, bottom: 2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: whiteColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Image.asset(
                  "assets/btn-edit.png",
                  fit: BoxFit.contain,
                  width: 32,
                ),
              ),
            ],
          )
        ]),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // CustomServiceButton(
                  //   imageUrl: 'assets/img_machinekrb.png',
                  //   buttonText: 'KR-B\nMachine',
                  //   onPressed: () {
                  //     context.read<PageBloc>().add(GoToMesinKRBPage());
                  //   },
                  // ),
                  CustomServiceButton(
                    imageUrl: 'assets/img_report.png',
                    buttonText: 'Laporan Perbaikan Mesin',
                    onPressed: () {
                      context.read<PageBloc>().add(GoToInputLPMPage());
                    },
                  ),
                  CustomServiceButton(
                    imageUrl: 'assets/ic-note.png',
                    buttonText: 'List LPM',
                    buttonColor: greenColor,
                    onPressed: () {
                      _launchURL(
                          "https://docs.google.com/spreadsheets/d/1i_ZsrfrCljRm6bKrRU1bd-dfzRvUihjaGB4HpOJScCI/edit?gid=0#gid=0");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
