import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos/main.dart';

import 'package:photos/screens/photos_list/bloc/photos_list_cubit.dart';
import 'package:photos/screens/update_photos/bloc/update_photos_cubit.dart';

import 'package:photos/screens/photos_list/photos_list_screen.dart';
import 'package:photos/screens/update_photos/update_photos_screen.dart';
import 'package:photos/screens/todos_list/todos_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;
  Color _iconColor = kColorScheme.onPrimary;
  static final List<Widget> _widgetOptions = <Widget>[
    BlocProvider(
      create: (context) => PhotosListCubit(),
      child: const PhotosListScreen(),
    ),
    BlocProvider(
      create: (context) => UpdatePhotosCubit(),
      child: const UpdatePhotosScreen(),
    ),
    const TodosScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _iconColor = Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onItemTapped(1);
        },
        shape: const CircleBorder(),
        backgroundColor: kColorScheme.primary,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: kColorScheme.primary,
        height: 70,
        shape: const CircularNotchedRectangle(),
        // Add this line to create a notched bottom app bar
        notchMargin: 10.0,

        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                color: _iconColor
                //kColorScheme.onPrimary,
              ),
              onPressed: () {
                _onItemTapped(0);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.task_alt_sharp,
                color:_iconColor
                //Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () {
                _onItemTapped(2);

              },
            ),
          ],
        ),
      ),

      // BottomNavigationBar(
      //   elevation: 0,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.list_alt_outlined,
      //         size: 15,
      //       ),
      //       label: 'List',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.update,
      //         size: 15,
      //       ),
      //       label: 'Add details',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: kColorScheme.onPrimary,
      //   onTap: _onItemTapped,
      //   backgroundColor: kColorScheme.primary,
      // ),
      //)
    );
  }
}
