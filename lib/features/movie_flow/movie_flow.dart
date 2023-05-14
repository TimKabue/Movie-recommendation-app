import 'package:flutter/material.dart';
import 'package:movie_recommendation/features/movie_flow/genre/genre_screen.dart';
import 'package:movie_recommendation/features/movie_flow/landing/landing_screen.dart';
import 'package:movie_recommendation/features/movie_flow/rating/rating_screen.dart';
import 'package:movie_recommendation/features/movie_flow/years_back/years_back_screen.dart';

class MovieFlow extends StatefulWidget {
  const MovieFlow({Key? key}) : super(key: key);

  @override
  State<MovieFlow> createState() => _MovieFlowState();
}

class _MovieFlowState extends State<MovieFlow> {
  //Controller for PageView
  final pageViewController = PageController();

  //Method:
  void nextPage(){
    pageViewController.nextPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  //Method:
  void previousPage(){
    pageViewController.previousPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInCubic,
    );
  }

  //Dispose of the controller.
  @override
  void dispose(){
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        LandingScreen(nextPage: nextPage, previousPage: previousPage),
        GenreScreen(nextPage: nextPage, previousPage: previousPage),
        RatingScreen(nextPage: nextPage, previousPage: previousPage),
        YearsBackScreen(nextPage: nextPage, previousPage: previousPage),
        const Scaffold(body: Placeholder(color: Colors.yellow,),),
        const Scaffold(body: Placeholder(color: Colors.green,),),
        const Scaffold(body: Placeholder(color: Colors.blue,),),
        const Scaffold(body: Placeholder(color: Colors.indigo,),),
        const Scaffold(body: Placeholder(color: Colors.purple,),),
      ],
    );
  }
}
