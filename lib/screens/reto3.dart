import 'package:flutter/material.dart';
import 'dart:convert';  // Para convertir la respuesta en JSON.
import 'package:http/http.dart' as http;  // Importar el paquete http.

class Reto3Screen extends StatefulWidget {
  const Reto3Screen({Key? key}) : super(key: key);

  @override
  _Reto3ScreenState createState() => _Reto3ScreenState();
}

class _Reto3ScreenState extends State<Reto3Screen> {
  // URL base para obtener la información de un Pokémon
  final String apiUrl = 'https://pokeapi.co/api/v2/pokemon';

  // Future para manejar la respuesta de la API
  Future<Map<String, dynamic>> fetchPokemon(String name) async {
    final response = await http.get(Uri.parse('$apiUrl/$name'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al obtener información de Pokémon para $name');
    }
  }

  // Future para almacenar los datos del Pokémon
  Future<Map<String, dynamic>>? _pokemonData;

  @override
  void initState() {
    super.initState();
    // Obtener la información de un Pokémon al inicializar la pantalla
    _pokemonData = fetchPokemon('pikachu');  // Puedes cambiar el nombre del Pokémon 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reto 3 - API Pokémon'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _pokemonData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();  // Mostrar cargando mientras se obtiene la información
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');  // Mostrar el error si ocurre
            } else if (snapshot.hasData) {
              // Si la API devuelve datos
              final data = snapshot.data!;
              final name = data['name'];
              final height = data['height'];
              final weight = data['weight'];
              final sprite = data['sprites']['front_default'];  // Imagen del Pokémon

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(sprite),  // Mostrar la imagen del Pokémon
                  const SizedBox(height: 20),
                  Text(
                    'Nombre: $name',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Altura: $height decímetros',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Peso: $weight hectogramos',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              );
            }
            return const Text('Sin datos');  // Si no hay datos
          },
        ),
      ),
    );
  }
}
