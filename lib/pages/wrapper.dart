part of 'pages.dart';

class Wrapper extends StatefulWidget {
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnMesinKRBPage)
                ? MesinKRBPage()
                : (pageState is OnWebViewPage)
                    ? WebViewPage(
                        pageName: pageState.pageName,
                        link: pageState.link,
                      )
                    : (pageState is OnDailyActicityPage)
                        ? DailyActivityPage()
                        : (pageState is OnChecklistMesinPage)
                            ? ChecklistMesinPage()
                            : (pageState is OnInputLPMPage)
                                ? InputLPMPage()
                         
                                    : MainPage());
  }
}
