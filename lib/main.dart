import 'package:flutter/material.dart';
import 'package:movies_db/services/movie_service.dart';
import 'package:movies_db/services/storage.dart';
import 'package:movies_db/views/home.dart';
import 'package:provider/provider.dart';

/*
I'm using provider for this sample app because it's small and only contains 2 pages,
 Also we do not need to use Getx to achieve the same results. Provider is a simple and light weight package 
 and does the job for us. I'm also not a big fan of Getx because it tries to do everything and that's bad by design, What if some functionality breaks?
 That's going to cause a lot of unnecessary trouble and hard to track down.  
 I like to keep it simple and don't want to add loads of packages for the stuff that I can do myself.
*/
void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => const MovieService(),
        ),
        Provider(create: (context) => FavouriteStorage()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      themeMode: ThemeMode.dark,
      home: const Home(),
    );
  }
}
