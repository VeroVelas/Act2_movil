import 'package:flutter/material.dart';
import 'package:flutter_application/screens/reto1.dart';
import 'package:flutter_application/screens/reto2.dart';
import 'package:flutter_application/screens/reto3.dart';  // Importa la pantalla de Reto 3
import 'screens/home.dart';
import 'screens/contact.dart';
import 'screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UP Chiapas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/contact': (context) => const ContactScreen(),
        '/reto1': (context) => Reto1Screen(),  // Reto 1
        '/reto2': (context) => const Reto2Screen(),  // Reto 2
        '/reto3': (context) => const Reto3Screen(),  // Reto 3
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('Contact'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: const Text('Reto 1'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/reto1');  // Redirige a Reto 1
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment_turned_in),
              title: const Text('Reto 2'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/reto2');  // Redirige a Reto 2
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment_rounded),
              title: const Text('Reto 3'),  // Agrega el Reto 3 al menú
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/reto3');  // Redirige a Reto 3
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}
