import 'package:flutter/material.dart';
import 'package:movies_db/services/storage.dart';
import 'package:provider/provider.dart';

class FavouriteMoviesScreen extends StatelessWidget {
  const FavouriteMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favourite Movies',
        ),
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder(
        stream: context.read<FavouriteStorage>().fetchFavourites,
        builder: (context, AsyncSnapshot<List<FavouritesMovie>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No saved favourites'),
              );
            }
            return OrientationBuilder(builder: (context, orientation) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                    childAspectRatio:
                        orientation == Orientation.portrait ? 0.5 : 1,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w780${snapshot.data![index].posterUrl}',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Colors.black87, Colors.transparent],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.center,
                                ),
                                borderRadius: BorderRadius.circular(16.0)),
                            clipBehavior: Clip.hardEdge,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data![index].releaseDate,
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  snapshot.data![index].title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                                Text(
                                  snapshot.data![index].overview,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 5.0,
                                )
                              ],
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
                                  snapshot.data![index].vote.toString(),
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
                  });
            });
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'An error occured',
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
