import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/src/features/authentification/screens/welcome_screen.dart';
import 'package:flutter_application_1/src/repository/auth_repository.dart';
import 'package:get/get.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthentificationRepository()));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // ignore: prefer_const_constructors
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white, // For text and icons
          elevation: 2,
          centerTitle: true,
          titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
               ),
          iconTheme: const IconThemeData(color: Colors.white),
             ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
          ),
      ),
      darkTheme: ThemeData(
        // ignore: prefer_const_constructors
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 10, 80, 13),
          foregroundColor: Colors.white, // For text and icons
          elevation: 2,
          centerTitle: true,
          titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
               ),
          iconTheme: const IconThemeData(color: Colors.white),
             ),
        colorScheme: ColorScheme.fromSeed(  
          seedColor: Color.fromARGB(255, 10, 80, 13),
          brightness: Brightness.dark,
          ),
      ),
      themeMode: ThemeMode.system,
      home: AppHome(),
    );
  }
}

class AppHome extends StatelessWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Name"),leading: const Icon(Icons.abc),
        centerTitle: true,),
      // floatingActionButton: FloatingActionButton(
      // onPressed: () {  },
      // child: const Icon(Icons.login),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(  
          children: [
            Text("Welcome to our application", style: Theme.of(context).textTheme.headline2),
            Text("Choose way to enter", style: Theme.of(context).textTheme.subtitle1,),
            // Text("Paragraph", style: Theme.of(context).textTheme.bodyText1,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary
              ),
              onPressed: () {}, 
              child: const Text("Login",),),
            OutlinedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary
              ),
              onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                );}, 
              child: const Text("Register"),
              ),
            const Padding(padding: EdgeInsets.all(20.0),
            ),
          ],
        ),
      ),

    );
  }
}