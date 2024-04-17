import 'package:flutter/material.dart';
import 'package:photos/main.dart';
import 'package:flutter/services.dart';

import 'add_company_details_screen.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Create profile'),
      ),
      body: Form(
        key: formKey,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Id',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextFormField(
                    // controller: _updatePhotosCubit?.titleController,
                    decoration: InputDecoration(
                      hintText: 'Enter name',
                    ),

                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Please enter title';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    // controller: _updatePhotosCubit?.titleController,
                    decoration: InputDecoration(
                      hintText: 'Enter username',
                    ),

                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Please enter username';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    // controller: _updatePhotosCubit?.titleController,
                    decoration: InputDecoration(
                      hintText: 'Enter email',
                    ),

                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@') ||
                          !value.contains('.')) {
                        return 'Invalid Email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    // controller: _updatePhotosCubit?.titleController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    decoration: InputDecoration(
                      hintText: 'Enter phone',
                    ),

                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Please enter phone';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enter Address',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // controller: _updatePhotosCubit?.titleController,
                    decoration: InputDecoration(
                      hintText: 'Enter street',
                    ),

                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Please enter street';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    // controller: _updatePhotosCubit?.titleController,
                    decoration: InputDecoration(
                      hintText: 'Enter suite',
                    ),

                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Please enter suite';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    // controller: _updatePhotosCubit?.titleController,
                    decoration: InputDecoration(
                      hintText: 'Enter city',
                    ),

                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Please enter city';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    // controller: _updatePhotosCubit?.titleController,
                    decoration: InputDecoration(
                      hintText: 'Enter zipcode',
                    ),

                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Please enter zipcode';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.85,
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        //  _postMethodCubit?.fetchPost();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AddCompanyDetailsScreen()));
                      }
                    },
                    //  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.cyan)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kColorScheme.primary),
                    child: Text(
                      'Continue',
                      style: Theme.of(context).textTheme.titleLarge,
                    )),
              ),
              bottom: 50,
            )
          ],
        ),
      ),
    );
  }
}
