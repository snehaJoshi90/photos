import 'package:flutter/material.dart';
import 'package:photos/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:photos/screens/users/bloc/users_state.dart';
import 'package:photos/screens/users/bloc/users_cubit.dart';

import 'user_details_screen.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final List<Map<String, dynamic>> _users = [
    {
      "id": 1,
      "name": "Leanne Graham",
      "username": "Bret",
      "email": "Sincere@april.biz",
    },
    {
      "id": 2,
      "name": "Ervin Howell",
      "username": "Antonette",
      "email": "Shanna@melissa.tv",
    },
    {
      "id": 3,
      "name": "Leanne Graham",
      "username": "Bret",
      "email": "Sincere@april.biz",
    },
    {
      "id": 4,
      "name": "Ervin Howell",
      "username": "Antonette",
      "email": "Shanna@melissa.tv",
    },
    {
      "id": 5,
      "name": "Leanne Graham",
      "username": "Bret",
      "email": "Sincere@april.biz",
    },
    {
      "id": 6,
      "name": "Ervin Howell",
      "username": "Antonette",
      "email": "Shanna@melissa.tv",
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<UsersCubit>(context).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state.usersResponseStatues == UsersResponseStatues.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.usersResponseStatues ==
              UsersResponseStatues.usersSuccess) {
            return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading:
                        Text('${state.usersResponse![index].id.toString()}'),
                    //Text(_users[index]['id'].toString()),
                    title: Text('${state.usersResponse![index].name}'),
                    // Text(_users[index]['name']),
                    subtitle: Text('${state.usersResponse![index].email}'),
                    //Text(_users[index]['email']),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserDetailsScreen(
                                usersResponse: state.usersResponse![index],
                              ),
                            ));
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: kColorScheme.tertiaryContainer,
                    thickness: 1,
                  );
                },
                itemCount: state.usersResponse?.length ?? 0);
          } else {
            return Center(child: Text('Error${state.message}'));
          }
        },
      ),
    );
  }
}
