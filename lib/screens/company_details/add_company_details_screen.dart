import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos/main.dart';

import 'package:photos/screens/company_details/bloc/add_company_details_cubit.dart';
import 'package:photos/screens/company_details/bloc/add_company_details_state.dart';

import 'package:photos/screens/bottom_navigation_screen.dart';





class AddCompanyDetailsScreen extends StatefulWidget {
  const AddCompanyDetailsScreen({super.key});

  @override
  State<AddCompanyDetailsScreen> createState() =>
      _AddCompanyDetailsScreenState();
}

class _AddCompanyDetailsScreenState extends State<AddCompanyDetailsScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AddCompanyDetailsCubit? _addCompanyDetailsCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addCompanyDetailsCubit = BlocProvider.of<AddCompanyDetailsCubit>(context);
    _addCompanyDetailsCubit?.addCompanyDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Company Details'),
        ),
        body: BlocBuilder<AddCompanyDetailsCubit, AddCompanyDetailsState>(
            builder: (context, state) {
          if (state.addCompanyDetailsStatues ==
              AddCompanyDetailsStatues.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.addCompanyDetailsStatues ==
              AddCompanyDetailsStatues.addCompanyDetailsSuccess) {
            return Form(
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
                          controller:
                              _addCompanyDetailsCubit?.companyController,
                          decoration: const InputDecoration(
                            hintText: 'Enter company name',
                          ),
                          validator: (value) {
                            if (value?.isEmpty == true) {
                              return 'Please enter company name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller:
                              _addCompanyDetailsCubit?.catchPhrasController,
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
                          controller: _addCompanyDetailsCubit?.bsController,
                          decoration: const InputDecoration(
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
                              _addCompanyDetailsCubit?.addCompanyDetails();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Successfully saved. '),
                                ),

                              );
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                               const BottomNavigationScreen()));
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
            );
          } else {
            return Center(
              child: Text('Error'),
            );
          }
        }));
  }
}
