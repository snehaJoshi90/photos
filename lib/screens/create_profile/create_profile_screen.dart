import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos/main.dart';
import 'package:flutter/services.dart';
import 'package:photos/screens/users/model/users_response.dart';

import '../company_details/add_company_details_screen.dart';
import 'package:photos/screens/create_profile/bloc/create_profile_cubit.dart';
import 'package:photos/screens/create_profile/bloc/create_profile_state.dart';
import 'package:photos/screens/company_details/bloc/add_company_details_cubit.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CreateProfileCubit? _createProfileCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createProfileCubit = BlocProvider.of<CreateProfileCubit>(context);
    _createProfileCubit?.createProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Create profile'),
      ),
      body: BlocBuilder<CreateProfileCubit, CreateProfileState>(
          builder: (context, state) {
        if (state.createProfileResponseStatues ==
            CreateProfileResponseStatues.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.createProfileResponseStatues ==
            CreateProfileResponseStatues.createProfileSuccess) {
          return Form(
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
                        'Id :${state.usersResponse!.id}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextFormField(
                        controller: _createProfileCubit?.nameController,
                        decoration: const InputDecoration(
                          hintText: 'Enter name',
                        ),
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _createProfileCubit?.userNameController,
                        decoration: const InputDecoration(
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
                        controller: _createProfileCubit?.emailController,
                        decoration: const InputDecoration(
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
                        controller: _createProfileCubit?.phoneController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        // Only numbers can be entered
                        decoration: const InputDecoration(
                          hintText: 'Enter phone',
                        ),

                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return 'Please enter phone';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Enter Address',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _createProfileCubit?.streetController,
                        decoration: const InputDecoration(
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
                        controller: _createProfileCubit?.suiteController,
                        decoration: const InputDecoration(
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
                        controller: _createProfileCubit?.cityController,
                        decoration: const InputDecoration(
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
                        ],
                        // Only numbers can be entered
                        controller: _createProfileCubit?.zipcodeController,
                        decoration: const InputDecoration(
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
                  bottom: 50,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width * 0.15,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            _createProfileCubit?.createProfile();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                          create: (context) =>
                                              AddCompanyDetailsCubit(),
                                          child: const AddCompanyDetailsScreen(),
                                        )));
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             const AddCompanyDetailsScreen()));
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
                )
              ],
            ),
          );
        } else {
          return Center(
            child: Text('Error'),
          );
        }
      }),
    );
  }
}
