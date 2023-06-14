//+------------------------------------------------------------------+
//| Imports.                                  |
//+------------------------------------------------------------------+
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommendation/features/movie_flow/genre/genre.dart';
import 'package:movie_recommendation/features/movie_flow/movie_flow_state.dart';

//+------------------------------------------------------------------+
//| GLOBAL  variables                                   |
//+------------------------------------------------------------------+
//---Provider
//This provider, movieFlowControllerProvider, is a StateNotifierProvider that's
// using the autoDispose functionality.
// It manages a MovieFlowController object which is responsible for handling the
// state of type MovieFlowState.
//The generic types <MovieFlowController, MovieFlowState> are specifying that
// this provider is managing a MovieFlowController and that the
// MovieFlowController is managing a state of type MovieFlowState.
final movieFlowControllerProvider =
    StateNotifierProvider.autoDispose<MovieFlowController, MovieFlowState>(
        (ref) {
  return MovieFlowController(MovieFlowState(
    pageController: PageController(),
  ));
});

//+-----------------------------------------------------------------------------+
//| The MovieFlowController class is used to manage the state of the movie flow
//| in the application.
//| It extends the StateNotifier class and provides various methods to manipulate
//| the state.                                   |
//+-----------------------------------------------------------------------------+
class MovieFlowController extends StateNotifier<MovieFlowState> {
  MovieFlowController(MovieFlowState state) : super(state);

  void toggleSelected(Genre genre) {
    state = state.copyWith(
      genres: [
        for (final oldGenre in state.genres)
          if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
      ],
    );
  }

  void updateRating(int updatedRating) {
    state = state.copyWith(rating: updatedRating);
  }

  void updateYearsBack(int updatedYearsBack) {
    state = state.copyWith(yearsBack: updatedYearsBack);
  }

  void nextPage() {
    if (state.pageController.page! >= 1) {
      if (!state.genres.any((element) => element.isSelected == true)) {
        return;
      }
    }

    state.pageController.nextPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  void previousPage() {
    state.pageController.previousPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }
}
