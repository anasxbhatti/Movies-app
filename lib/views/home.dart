import 'package:flutter/material.dart';
import 'package:movies_db/views/favourites_list_widget.dart';
import 'package:movies_db/views/movie_list_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final views = <Widget>[
    MovieListWidget(),
    FavouriteMoviesScreen(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: views,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) => setState(() {
          index = value;
        }),
        items: [
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.explore_rounded,
              ),
              label: 'Discover'),
          BottomNavigationBarItem(
              icon: Icon(
                index == 1
                    ? Icons.favorite_rounded
                    : Icons.favorite_outline_rounded,
              ),
              label: 'Favourites'),
        ],
      ),
    );
  }
}
