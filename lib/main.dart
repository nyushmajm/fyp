import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freelance_clone_app/LoginPage/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              home: Scaffold(
                backgroundColor: Colors.blue,
                body: Center(
                  child: Text(
                    'Freelance Clone App is being initialized',
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text(
                    'An error has been occured',
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }
          return MaterialApp(
            title: 'FreelanceFinder',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.blue,
            ),
            home: Login(),
          );
        });
  }
}
