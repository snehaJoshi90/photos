import 'package:flutter/material.dart';
import 'package:photos/main.dart';

class AddCompanyDetailsScreen extends StatefulWidget {
  const AddCompanyDetailsScreen({super.key});

  @override
  State<AddCompanyDetailsScreen> createState() =>
      _AddCompanyDetailsScreenState();
}

class _AddCompanyDetailsScreenState extends State<AddCompanyDetailsScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Company Details'),
      ),
      body: Form(
        key: formKey,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                 const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    // controller: _updatePhotosCubit?.titleController,
                    decoration:const InputDecoration(
                      hintText: 'Enter company name',
                    ),

                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Please enter company name';
                      }
                      return null;
                    },
                  ),
                const  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // controller: _updatePhotosCubit?.titleController,
                    decoration: const InputDecoration(
                      hintText: 'catchPhrase',
                    ),
                    maxLength: 50,

                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Please enter catchPhrase';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    // controller: _updatePhotosCubit?.titleController,
                    decoration:const InputDecoration(
                      hintText: 'bs',
                    ),

                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Please enter bs';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.85,
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        //  _postMethodCubit?.fetchPost();
                        ScaffoldMessenger.of(context).showSnackBar(
                        const  SnackBar(
                            content: Text('Successfully saved. '),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kColorScheme.primary),
                    child: Text(
                      'Save',
                      style: Theme.of(context).textTheme.titleLarge,
                    )),
              ),

            )
          ],
        ),
      ),
    );
  }
}
