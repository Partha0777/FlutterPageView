import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('WebView in PageView.builder'),
        ),
        body: WebPageViewer(),
      ),
    );
  }
}

class WebPageViewer extends StatefulWidget {
  @override
  _WebPageViewerState createState() => _WebPageViewerState();
}

class _WebPageViewerState extends State<WebPageViewer> {
  final PageController _controller = PageController();

  // List of URLs to display in the web views
  final List<String> pages = [
    'https://www.example.com',
    'https://www.wikipedia.org',
    'https://www.flutter.dev',
    'https://www.curiozing.com',
    'https://www.android.com',
    'https://www.google.com',
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: pages.length,
      allowImplicitScrolling: true,
      itemBuilder: (context, index) {
        return WebView(
          initialUrl: pages[index],
          javascriptMode: JavascriptMode.unrestricted,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
