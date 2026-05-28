import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieCard extends StatelessWidget {

  final Movie movie;
  final VoidCallback onTap;

  const MovieCard({
    super.key,
    required this.movie,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.all(12),

      child: InkWell(
        onTap: onTap,

        child: Row(
          children: [

            // Poster image
            Hero(
              tag: movie.id,

              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),

                child: Image.network(
                  movie.posterUrl,
                  width: 120,
                  height: 180,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 120,
                      height: 180,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                        size: 40,
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: 120,
                      height: 180,
                      color: Colors.grey[200],
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Movie info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      movie.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 8),

                    Text(
                      '⭐ ${movie.rating}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      movie.overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}