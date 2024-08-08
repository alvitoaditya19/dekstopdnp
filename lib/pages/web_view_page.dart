part of 'pages.dart';

class WebViewPage extends StatefulWidget {
  final String pageName;
  final String link;

  
  WebViewPage({required this.pageName, required this.link});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToMainPage());

        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blueColor,
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios, color: whiteColor),
            onTap: () => context.read<PageBloc>().add(GoToMainPage()),
          ),
          title: Text(
            '${widget.pageName}',
            style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
          ),
        ),
        body: WebView(
          initialUrl: widget.link,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
