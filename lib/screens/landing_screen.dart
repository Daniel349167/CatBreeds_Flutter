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
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 8.0, right: 8.0),
            child: TextField(
              controller: searchController,
              onChanged: filterSearchResults,
              decoration: InputDecoration(
                labelText: "Buscar por raza, origen o inteligencia...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          // Lista de razas filtradas
          Expanded(
            child: filteredBreeds.isEmpty
                ? Center(child: CircularProgressIndicator())
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
