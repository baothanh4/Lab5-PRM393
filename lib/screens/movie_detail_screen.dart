import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieDetailScreen extends StatefulWidget {

  final Movie movie;

  const MovieDetailScreen({
    super.key,
    required this.movie,
  });

  @override
  State<MovieDetailScreen> createState() =>
      _MovieDetailScreenState();
}

class _MovieDetailScreenState
    extends State<MovieDetailScreen> {

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {

    final movie = widget.movie;

    return Scaffold(

      body: CustomScrollView(
        slivers: [

          // Hero banner
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.4),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),

            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: const EdgeInsetsDirectional.only(
                start: 16,
                bottom: 16,
              ),
              title: Text(
                movie.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 2),
                      blurRadius: 4.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),

              background: Stack(
                fit: StackFit.expand,

                children: [

                  Hero(
                    tag: movie.id,

                    child: Image.network(
                      movie.posterUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.image_not_supported,
                            color: Colors.grey,
                            size: 100,
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: Colors.grey[200],
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    ),
                  ),

                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,

                        colors: [
                          Colors.transparent,
                          Colors.black87,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Detail content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  // Rating
                  Text(
                    '⭐ ${movie.rating}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Genres
                  Wrap(
                    spacing: 8,

                    children: movie.genres.map((genre) {

                      return Chip(
                        label: Text(genre),
                      );

                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // Overview title
                  const Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Overview text
                  Text(
                    movie.overview,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Action buttons
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceAround,

                    children: [

                      IconButton(
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),

                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                      ),

                      IconButton(
                        icon: const Icon(Icons.star),

                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content:
                              Text('Rate clicked'),
                            ),
                          );
                        },
                      ),

                      IconButton(
                        icon: const Icon(Icons.share),

                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content:
                              Text('Share clicked'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Trailer title
                  const Text(
                    'Trailers',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Trailer list
                  ListView.builder(
                    shrinkWrap: true,

                    physics:
                    const NeverScrollableScrollPhysics(),

                    itemCount: movie.trailers.length,

                    itemBuilder: (context, index) {

                      final trailer =
                      movie.trailers[index];

                      return Card(
                        child: ListTile(
                          leading: const Icon(
                            Icons.play_circle_fill,
                          ),

                          title: Text(trailer.title),

                          subtitle:
                          Text(trailer.duration),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}