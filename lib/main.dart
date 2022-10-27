import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";
import "euchre_helper.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Euchre Helper",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: const DefaultTextStyle(
          style: TextStyle(fontSize: 30, color: Colors.black),
          child: EuchreHelper(),
        ),
        bottomSheet: Center(
          heightFactor: 2,
          child: RichText(
            text: TextSpan(children: [
              hyperlink(
                label: "Source",
                url: "https://github.com/object-Object/euchre_helper",
              ),
              const TextSpan(
                text: " • ",
                style: TextStyle(color: Colors.grey),
              ),
              hyperlink(
                label: "Icons",
                url: "https://www.me.uk/cards/makeadeck.cgi",
              ),
              const TextSpan(
                text: " • Powered by ",
                style: TextStyle(color: Colors.grey),
              ),
              hyperlink(label: "Flutter", url: "https://flutter.dev/"),
            ]),
          ),
        ),
      ),
    );
  }
}

TextSpan hyperlink({required String label, required String url}) {
  return TextSpan(
    text: label,
    style: const TextStyle(
      decoration: TextDecoration.underline,
      color: Colors.grey,
    ),
    recognizer: TapGestureRecognizer()
      ..onTap = () => launchUrl(
            Uri.parse(url),
          ),
  );
}
