import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/Moviemoduels/domain/baserepository/base_movieRepository.dart';
import 'package:movies/Moviemoduels/domain/movie_usecase/get_popularusecase.dart';
import 'package:movies/Moviemoduels/domain/movie_usecase/get_topratedmovies_usecase.dart';
import 'package:movies/Moviemoduels/domain/movie_usecase/getnowplaying_usecase.dart';
import 'package:movies/Moviemoduels/pressentation/maneger/movie_bloc/movie_bloc.dart';
import 'package:movies/Moviemoduels/pressentation/maneger/movie_bloc/movie_events.dart';
import 'package:movies/Moviemoduels/pressentation/views/widgets/get_nowplaying.dart';
import 'package:movies/Moviemoduels/pressentation/views/widgets/popularwidget.dart';
import 'package:movies/Moviemoduels/pressentation/views/widgets/top_ratedwidget.dart';
import 'package:movies/core/locator/service_locator.dart';
import 'package:movies/core/utls/appconstants.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);
  final String img = AppConstants.dumyimgurl;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MovieBloc(
          getNowPlaying: getit<GetNowPlaying>(),
          popularMovies: getit<GetPopularMovies>(),
          topRatedMovies: getit<GetTopRatedMovies>())
        ..add(GetNowPlayingMovieEvent())
        ..add(GetPopularMovieEvent())..add(GetTopRatedMovieEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GetNowPlayingwidget(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO POPULAR SCREEN
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'See More',
                              style: AppConstants.textwhie,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularWidget(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Rated",
                      style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO Top Rated Movies Screen
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'See More',
                              style: AppConstants.textwhie,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedWidgets(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
