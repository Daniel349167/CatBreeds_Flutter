import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/breed.dart';

class DetailScreen extends StatelessWidget {
  final Breed breed;

  DetailScreen({required this.breed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(breed.name)),
      body: Column(
        children: [
          // La imagen estática, con indicador de carga
          breed.imageUrl.isNotEmpty
              ? CachedNetworkImage(
                  imageUrl: breed.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
              : Container(height: 250, color: Colors.grey),
          
          // Descripción dentro de SingleChildScrollView para permitir scroll solo en el texto
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      breed.description,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
