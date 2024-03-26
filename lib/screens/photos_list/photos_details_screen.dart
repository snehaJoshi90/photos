import 'package:flutter/material.dart';
import 'package:photos/main.dart';
import 'package:photos/screens/photos_list/model/photos_list_response.dart';

class PhotosDetailsScreen extends StatelessWidget {
  final PhotosListResponse photosListResponse;

  const PhotosDetailsScreen({super.key, required this.photosListResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Photos'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ID: ${photosListResponse.id}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(photosListResponse.url.toString())),
              const SizedBox(
                height: 20,
              ),
              Text('${photosListResponse.title}'),
            ],
          ),
        ),
      ),
    );
  }
}
