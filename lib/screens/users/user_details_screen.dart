import 'package:flutter/material.dart';

import 'model/users_response.dart';

class UserDetailsScreen extends StatelessWidget {
  final UsersResponse usersResponse;

  const UserDetailsScreen({super.key, required this.usersResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'User ID: ${usersResponse.id}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text('Name: '),
                            Text(
                              ' ${usersResponse.name}',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Use Name: ${usersResponse.username}'),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Address',
                            style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text('Suite: ${usersResponse.address!.suite}',maxLines: 3,),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('Street: ${usersResponse.address!.street}'),
                          ],
                        ),
                        Row(
                          children: [
                            Text('City: ${usersResponse.address!.city}'),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                                'Latitude: ${usersResponse.address!.geo!.lat}'),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                                'Longitude: ${usersResponse.address!.geo!.lng}'),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Zipcode: ${usersResponse.address!.zipcode}'),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text('Email: ${usersResponse.email}'),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Phone: '),
                            Text(
                              ' ${usersResponse.phone}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Website: ${usersResponse.website}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text('Company Name: '),
                          Text(
                            ' ${usersResponse.company!.name}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 3,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('BS: ${usersResponse.company!.bs}'),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Catch Phrase: ${usersResponse.company!.catchPhrase}',
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
    //Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //    // crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text('${usersResponse.name}User name'),
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}
