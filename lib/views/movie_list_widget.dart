import 'package:flutter/material.dart';
import 'package:movies_db/models/movie.dart';
import 'package:movies_db/services/movie_service.dart';
import 'package:movies_db/services/storage.dart';
import 'package:provider/provider.dart';
import 'package:movies_db/components/error_widget.dart';

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final pages = [];

  late Future<List<Movie>> moviesFuture;
  @override
  void initState() {
    moviesFuture = context.read<MovieService>().fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.onBackground,
      ),
      body: IndexedStack(
        children: [
          FutureBuilder(
            future: moviesFuture,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return ErrorView(
                      onTap: () {
                        setState(() {
                          moviesFuture =
                              context.read<MovieService>().fetchMovies();
                        });
                      },
                    );
                  } else if (snapshot.hasData) {
                    final items = snapshot.data ?? [];
                    return OrientationBuilder(builder: (context, orientation) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              orientation == Orientation.portrait ? 2 : 3,
                          childAspectRatio:
                              orientation == Orientation.portrait ? 0.5 : 1,
                          mainAxisSpacing: 5.0,
                          crossAxisSpacing: 5.0,
                        ),
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w780${item.posterUrl!}',
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black87,
                                        Colors.transparent
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.center,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.releaseDate,
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        item.title,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0),
                                      ),
                                      Text(
                                        item.overview,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 66,
                                  right: 16.0,
                                  child: Material(
                                    shape: const CircleBorder(),
                                    color: Colors.white54,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () async {
                                          setState(
                                            () {
                                              items[index] = item.copyWith(
                                                saveToFavourite: !items[index]
                                                    .saveToFavourite,
                                              );
                                            },
                                          );
                                          await context
                                              .read<FavouriteStorage>()
                                              .saveToFavourites(item)
                                              .then(
                                                (value) => ScaffoldMessenger.of(
                                                        context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        'Item saved to favourites'),
                                                  ),
                                                ),
                                              );
                                        },
                                        child: Icon(
                                          items[index].saveToFavourite
                                              ? Icons.favorite_rounded
                                              : Icons.favorite_outline_rounded,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 16.0,
                                  right: 16.0,
                                  child: Material(
                                    shape: const CircleBorder(),
                                    color: Colors.white54,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        items[index].vote.toString(),
                                        style: const TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: items.length,
                      );
                    });
                  } else {
                    return const SizedBox.shrink();
                  }

                default:
                  return const Center(
                    child: Text('Nothing to show'),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
