import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import '../models/breed.dart';
import '../screens/detail_screen.dart';

class BreedTile extends StatefulWidget {
  final Breed breed;

  const BreedTile({Key? key, required this.breed}) : super(key: key);

  @override
  _BreedTileState createState() => _BreedTileState();
}

class _BreedTileState extends State<BreedTile> with AutomaticKeepAliveClientMixin {
  String currentImageUrl = '';

  @override
  void initState() {
    super.initState();
    currentImageUrl = widget.breed.imageUrl;
    tryAlternateFormat();
  }

  Future<void> tryAlternateFormat() async {
    try {
      final response = await http.get(Uri.parse(currentImageUrl));
      if (response.statusCode != 200) {
        setState(() {
          currentImageUrl = widget.breed.imageUrl.replaceAll('.jpg', '.png');
        });
      }
    } catch (e) {
      setState(() {
        currentImageUrl = widget.breed.imageUrl.replaceAll('.jpg', '.png');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: currentImageUrl,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
      title: Text(widget.breed.name),
      subtitle: Text('Origen: ${widget.breed.origin} - Inteligencia: ${widget.breed.intelligence}'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(breed: widget.breed),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
