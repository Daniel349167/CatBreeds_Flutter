import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/breed.dart';
import '../widgets/breed_tile.dart'; // Importa el widget BreedTile

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List<Breed> breeds = [];
  List<Breed> filteredBreeds = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchBreeds();
  }

  Future<void> fetchBreeds() async {
    final response = await http.get(
      Uri.parse('https://api.thecatapi.com/v1/breeds'),
      headers: {
        'x-api-key': 'tu-api-key-aqui',
      },
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      setState(() {
        breeds = jsonResponse.map((data) => Breed.fromJson(data)).toList();
        filteredBreeds = breeds; // Inicialmente mostramos todos los resultados.
      });
    } else {
      throw Exception('Failed to load breeds');
    }
  }

  void filterSearchResults(String query) {
    List<Breed> searchResults = [];
    if (query.isNotEmpty) {
      searchResults = breeds.where((breed) {
        return breed.name.toLowerCase().contains(query.toLowerCase()) ||
            breed.origin.toLowerCase().contains(query.toLowerCase()) ||
            breed.intelligence.toString().contains(query);
      }).toList();
    } else {
      searchResults = breeds; // Si el texto está vacío, mostramos todas las razas.
    }
    setState(() {
      filteredBreeds = searchResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cat Breeds')),
      body: Column(
        children: [
          // Barra de búsqueda
          Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
          child: Container(
            height: 60, // Ajusta la altura del contenedor
            child: TextFormField(
              controller: searchController,
              onChanged: filterSearchResults,
              decoration: InputDecoration(
                labelText: "Buscar por raza, origen o inteligencia...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: Icon(Icons.search),
              ),
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),


          // Lista de razas filtradas o mensaje de "No se encontraron resultados"
          Expanded(
            child: filteredBreeds.isEmpty
                ? (searchController.text.isNotEmpty // Solo muestra el mensaje si hay algo en el campo de búsqueda
                    ? Center(
                        child: Text(
                          'No se encontraron resultados',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    : Center(child: CircularProgressIndicator()) // Si no hay búsqueda, muestra el loading al inicio
                  )
                : ListView.builder(
                    itemCount: filteredBreeds.length,
                    itemBuilder: (context, index) {
                      return BreedTile(breed: filteredBreeds[index]); // Usa el widget BreedTile
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
