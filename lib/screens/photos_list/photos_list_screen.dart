import 'package:flutter/material.dart';
import 'package:photos/main.dart';

class PhotosListScreen extends StatefulWidget {
  const PhotosListScreen({super.key});

  @override
  State<PhotosListScreen> createState() => _PhotosListScreenState();
}

class _PhotosListScreenState extends State<PhotosListScreen> {
  List<Map<String, dynamic>> _photosList = [
    {
      "albumId": '1',
      "id": '1',
      "title": "accusamus beatae ad facilis cum similique qui sunt",
      "url": "https://via.placeholder.com/600/92c952",
      "thumbnailUrl": "https://via.placeholder.com/150/92c952"
    },
    {
      "albumId": '1',
      "id": '2',
      "title": "reprehenderit est deserunt velit ipsam",
      "url": "https://via.placeholder.com/600/771796",
      "thumbnailUrl": "https://via.placeholder.com/150/771796"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Photos list'),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: ListTile(
                      leading: Text(
                        _photosList[index]['id'],
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      title: Text(_photosList[index]['title']),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: _photosList.length),
          ],
        )
        //Text('Test',style: Theme.of(context).textTheme.titleLarge,)

        );
  }
}
