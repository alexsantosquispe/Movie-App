import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/core/models/models.dart';
import 'package:movie_app/src/ui/constants/base_colors.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    Key key,
    @required this.movie,
    this.isSmall = true,
  }) : super(key: key);

  final Movie movie;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    const String url = 'https://image.tmdb.org/t/p/original';
    return Container(
      width: isSmall ? 180 : 310,
      height: 260.0,
      margin: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: isSmall
                ? '$url${movie.posterPath}'
                : '$url${movie.backdropPath}',
            imageBuilder: (context, imageProvider) => Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                    LoadBackground,
                    BlendMode.colorBurn,
                  ),
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Flexible(
            child: Text(movie.title),
          ),
        ],
      ),
    );
  }
}
