// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "BPSense",
//       home: Padding(
//         padding: EdgeInsets.only(top: 50),
//         child: WebViewPage(),
//       ),
//     );
//   }
// }

// import 'package:flutter/foundation.dart';
import 'package:bpsense_app/test_page.dart';
import 'package:bpsense_app/webview_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (!kIsWeb &&
  //     kDebugMode &&
  //     defaultTargetPlatform == TargetPlatform.android) {
  //   await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  // }

  await Permission.camera.request();
  await Permission.storage.request();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": ((context) => const WebViewPage()),
        "/test": ((context) => const TestPage()),
      },
    );
  }
}
