import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos/screens/update_photos/bloc/update_photos_state.dart';
import 'package:photos/screens/update_photos/bloc/update_photos_cubit.dart';

class UpdatePhotosScreen extends StatefulWidget {
  const UpdatePhotosScreen({super.key});

  @override
  State<UpdatePhotosScreen> createState() => _UpdatePhotosScreenState();
}

class _UpdatePhotosScreenState extends State<UpdatePhotosScreen> {
  UpdatePhotosCubit? _updatePhotosCubit;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _updatePhotosCubit = BlocProvider.of<UpdatePhotosCubit>(context);
    _updatePhotosCubit?.updatePhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add title'),
        ),
        body: Form(
          key: _formKey,
          child: Stack(alignment: Alignment.topCenter, children: [
            BlocBuilder<UpdatePhotosCubit, UpdatePhotosState>(
                builder: (context, state) {
              if (state.updatePhotosResponseStatus ==
                  UpdatePhotosResponseStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.updatePhotosResponseStatus ==
                  UpdatePhotosResponseStatus.updatePhotosSuccess) {
                final update = state.updatePhotosResponse;
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Enter Details',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text('AlbumId :${update?.albumId}'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text('ID: '),
                            Text(
                              '${update?.id}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              // style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _updatePhotosCubit?.titleController,
                          decoration: InputDecoration(
                            hintText: 'Enter title',
                          ),
                          maxLength: 100,
                          validator: (value) {
                            if (value?.isEmpty == true) {
                              return 'Please enter title';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state.updatePhotosResponseStatus ==
                  UpdatePhotosResponseStatus.initial) {
                return Center(
                  child: Text('Initial state'),
                );
              } else {
                return Center(
                  child: Text('Error'),
                );
              }
            }),
            Positioned(
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _updatePhotosCubit?.updatePhotos();
                      //  _postMethodCubit?.fetchPost();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Successfully saved. '),
                        ),
                      );
                    }
                  },
                  child: Text('save',style: Theme.of(context).textTheme.titleLarge,)),
              bottom: 200,
              left: 300,
            )
          ]),
        ));
  }
}
