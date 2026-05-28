import 'package:flutter/material.dart';

import '../data/sample_data.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';
import 'movie_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {

  String search = '';

  @override
  Widget build(BuildContext context) {

    // Filter movies
    final filteredMovies = movies.where((movie) {

      return movie.title
          .toLowerCase()
          .contains(search.toLowerCase());

    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
      ),

      body: Column(
        children: [

          // Search bar
          Padding(
            padding: const EdgeInsets.all(12),

            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search movies...',
                prefixIcon: const Icon(Icons.search),

                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(12),
                ),
              ),

              onChanged: (value) {
                setState(() {
                  search = value;
                });
              },
            ),
          ),

          // Movie list
          Expanded(
            child: ListView.builder(
              itemCount: filteredMovies.length,

              itemBuilder: (context, index) {

                final Movie movie =
                filteredMovies[index];

                return MovieCard(
                  movie: movie,

                  onTap: () {

                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (_) =>
                            MovieDetailScreen(
                              movie: movie,
                            ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}