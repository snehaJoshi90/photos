
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:photos/screens/photos_list/bloc/photos_list_cubit.dart';
import 'package:photos/screens/photos_list/bloc/photos_list_state.dart';

import 'package:photos/screens/photos_list/photos_details_screen.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<PhotosListCubit>(context).fetchPhotosList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Photos list'),
        // ),
        body: BlocBuilder<PhotosListCubit, PhotoListState>(
            builder: (context, state) {
          if (state.photosListResponseStatus ==
              PhotosListResponseStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.photosListResponseStatus ==
              PhotosListResponseStatus.photosListSuccess) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PhotosDetailsScreen(
                                    photosListResponse:
                                        state.photosListResponse![index]),
                              ));
                        },
                        child: Card(
                          //color: Theme.of(context).colorScheme.primaryContainer,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(

                                leading: Text(
                                  state.photosListResponse![index].id.toString(),
                                  // _photosList[index]['id'],
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                trailing: Image.network(state.photosListResponse![index].url.toString()),
                                title: Text(
                                    state.photosListResponse![index].title ?? '')
                                //Text(_photosList[index]['title']),

                                ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: state.photosListResponse?.length ?? 0,
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text('Failed to load list: ${state.message}'),
            );
          }
        })
        //Text('Test',style: Theme.of(context).textTheme.titleLarge,)

        );
  }
}
