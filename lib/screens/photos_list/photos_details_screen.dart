import 'package:flutter/material.dart';
import 'package:photos/screens/photos_list/model/photos_list_response.dart';

class PhotosDetailsScreen extends StatelessWidget {
  final PhotosListResponse photosListResponse;
  const PhotosDetailsScreen({super.key,required this.photosListResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${photosListResponse.title}')
        ],
      ),
    );
  }
}
