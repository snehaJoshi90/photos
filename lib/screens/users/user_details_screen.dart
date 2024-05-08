import 'package:flutter/cupertino.dart';
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
        child: Column(
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
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text('Use Name: ${usersResponse.username}'),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Address',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Suite: ${usersResponse.address!.suite}',
                        //maxLines: 3,
                      ),
                      Text('Street: ${usersResponse.address!.street}'),
                      Text('City: ${usersResponse.address!.city}'),
                      Text('Latitude: ${usersResponse.address!.geo!.lat}'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Longitude: ${usersResponse.address!.geo!.lng}'),
                      Text('Zipcode: ${usersResponse.address!.zipcode}'),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Email: ${usersResponse.email}'),
                      Row(
                        children: [
                          const Text('Phone: '),
                          Text(
                            ' ${usersResponse.phone}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text('Website: ${usersResponse.website}'),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Company Name: '),
                        Expanded(
                          child: Text(
                            ' ${usersResponse.company!.name}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            // maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'BS: ${usersResponse.company!.bs}',
                      maxLines: 3,
                    ),
                    Text(
                      'Catch Phrase: ${usersResponse.company!.catchPhrase}',
                      maxLines: 3,
                    ),
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
