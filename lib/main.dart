import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furnizor/Provider/DataProvider.dart';
import 'package:furnizor/Screens/homePage.dart';
import 'package:provider/provider.dart';
import 'Provider/firebaseMethods.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DataProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snap) {
        if (snap.hasError) {
          return Center(
            child: CircularProgressIndicator(),
          );
          // ignore: missing_return
        } else if (snap.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: GoogleLoginPage.routName,
            routes: {
              GoogleLoginPage.routName: (ctx) => GoogleLoginPage(),
              HomePage.routName: (ctx) => HomePage()
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class GoogleLoginPage extends StatelessWidget {
  static final String routName = "/login";
  FirebaseMethods firebaseMethods = FirebaseMethods();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          child: Text("Google SignIn"),
          onPressed: () {
            Navigator.pushReplacementNamed(context, HomePage.routName);
            firebaseMethods.signInWithGoogle().then((value) {
            });
          },
        ),
      ),
    );
  }
}
