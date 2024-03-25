import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:photos/screens/photos_list/bloc/photos_list_cubit.dart';

import 'package:photos/screens/photos_list/photos_list_screen.dart';

void main() {
  runApp(const MyApp());
}

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.lightBlue.shade50);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Photos',
        theme: ThemeData().copyWith(
            colorScheme: kColorScheme,
            appBarTheme: AppBarTheme().copyWith(
                backgroundColor: kColorScheme.onPrimaryContainer,
                foregroundColor: kColorScheme.primaryContainer,
                centerTitle: true),
            cardTheme: const CardTheme().copyWith(
                color: kColorScheme.secondaryContainer,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
            textTheme: GoogleFonts.montserratTextTheme().copyWith(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kColorScheme.onSecondaryContainer,
                    fontSize: 18))),
        home: BlocProvider(
          create: (context) => PhotosListCubit(),
          child: const PhotosListScreen(),
        ));
  }
}
