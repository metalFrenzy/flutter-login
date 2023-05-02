import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:grad_app/firebase_options.dart';
import 'package:grad_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

import './screens/auth_screen.dart';
import './providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Vaccify.EG',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Lato',
          textTheme: ThemeData.light().textTheme.copyWith(
                // style of the textformfield
                labelSmall: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        home: StreamBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
            }
            return AuthScreen();
          },
          stream: FirebaseAuth.instance.authStateChanges(),
        ),
      ),
    );
  }
}
