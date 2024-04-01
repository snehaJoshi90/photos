import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos/main.dart';

import 'package:photos/screens/photos_list/bloc/photos_list_cubit.dart';
import 'package:photos/screens/update_photos/bloc/update_photos_cubit.dart';

import 'package:photos/screens/photos_list/photos_list_screen.dart';
import 'package:photos/screens/update_photos/update_photos_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    BlocProvider(
      create: (context) => PhotosListCubit(),
      child: const PhotosListScreen(),
    ),

    BlocProvider(
      create: (context) => UpdatePhotosCubit(),
      child: const UpdatePhotosScreen(),
    ),

    // Text(
    //   'Index 3: Update details',
    //   // style: Theme.of(context).textTheme.titleLarge,
    // ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('photos album'),
      //
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Update details',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kColorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}

// class BottomNavigationBarExample extends StatefulWidget {
//   const BottomNavigationBarExample({super.key});
//
//   @override
//   State<BottomNavigationBarExample> createState() =>
//       _BottomNavigationBarExampleState();
// }
//
// class _BottomNavigationBarExampleState
//     extends State<BottomNavigationBarExample> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Index 0: Home',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 1: Business',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: School',
//       style: optionStyle,
//     ),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('BottomNavigationBar Sample'),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             label: 'Business',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'School',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
