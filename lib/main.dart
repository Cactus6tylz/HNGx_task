import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String slackName = "Eze Ugochukwu Micheal";
  final String location = "Enugu, Nigeria";
  final String githubProfileUrl = "https://github.com/Cactus6tylz";

  const MyHomePage({super.key});

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        color: Colors.blueGrey, // Set your desired background color here
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(
                    "assets/profile1.jpeg",
                    height: 150,
                    width: 150,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(
                slackName,
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Text(
                location,
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        GitHubWebView(githubProfileUrl: githubProfileUrl),
                  ));
                },
                child: const Text(
                  "Open GitHub",
                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GitHubWebView extends StatelessWidget {
  final String githubProfileUrl;

  // Named constructor
  GitHubWebView({required this.githubProfileUrl});

  // Default constructor
  GitHubWebView.defaultConstructor(this.githubProfileUrl);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: const Text("GitHub Profile"),
      ),
      url: 'https://github.com/Cactus6tylz', // You should specify the URL here
    );
  }
}
