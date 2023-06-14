import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommendation/core/constants.dart';
import 'package:movie_recommendation/core/widgets/primary_button.dart';
import 'package:movie_recommendation/features/movie_flow/movie_flow_controller.dart';
import 'package:movie_recommendation/features/movie_flow/result/movie.dart';

import '../genre/genre.dart';

class ResultScreen extends ConsumerWidget {
  //+------------------------------------------------------------------+
  //| Instance fields.                                  |
  //+------------------------------------------------------------------+
  final double movieHeight = 150;

  //+------------------------------------------------------------------+
  //| Default constructor.                                  |
  //+------------------------------------------------------------------+
  const ResultScreen({Key? key}) : super(key: key);

  //+------------------------------------------------------------------+
  //| Class methods.                                  |
  //+------------------------------------------------------------------+
  static route({bool fullscreenDialog = true}) => MaterialPageRoute(
        builder: (BuildContext context) => const ResultScreen(),
      );

  //+------------------------------------------------------------------+
  //| ***PLACEHOLDER DATA***.                                  |
  //+------------------------------------------------------------------+
  final movie = const Movie(
    title: 'The Hulk',
    overview:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis tortor a nisl luctus sodales sit amet vitae massa. Sed laoreet, velit vel semper ultricies, nibh libero ultrices nisl, et rhoncus ligula dolor non nibh.',
    voteAverage: 4.8,
    genres: [Genre(name: 'Action'), Genre(name: 'Fantasy')],
    releaseDate: '2019-05-24',
    backdropPath: '',
    posterPath: '',
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CoverImage(),
                    Positioned(
                      width: MediaQuery.of(context).size.width,
                      bottom: -(movieHeight / 2),
                      child: MovieImageDetails(
                        movie: ref.watch(movieFlowControllerProvider).movie,
                        movieHeight: movieHeight,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: movieHeight / 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    ref.watch(movieFlowControllerProvider).movie.overview,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          PrimaryButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: 'Find another movie',
          ),
          const SizedBox(
            height: kMediumSpacing,
          ),
        ],
      ),
    );
  }
}

class CoverImage extends StatelessWidget {
  const CoverImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 298,
      ),
      child: ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Colors.transparent,
            ],
          ).createShader(
            Rect.fromLTRB(0, 0, rect.width, rect.height),
          );
        },
        blendMode: BlendMode.dstIn,
        child: const Placeholder(),
      ),
    );
  }
}

class MovieImageDetails extends ConsumerWidget {
  final Movie movie;
  final double movieHeight;

  const MovieImageDetails({
    Key? key,
    required this.movie,
    required this.movieHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: movieHeight,
            child: const Placeholder(),
          ),
          const SizedBox(
            width: kMediumSpacing,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: theme.textTheme.titleLarge,
                ),
                Text(
                  movie.genresCommaSeparated,
                  style: theme.textTheme.bodyMedium,
                ),
                Row(
                  children: [
                    Text(
                      movie.voteAverage.toString(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.textTheme.bodyMedium?.color
                            ?.withOpacity(0.62),
                      ),
                    ),
                    const Icon(
                      Icons.star_rounded,
                      size: 20.0,
                      color: Colors.amber,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
