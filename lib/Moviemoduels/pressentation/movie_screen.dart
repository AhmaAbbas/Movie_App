import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Moviemoduels/domain/movie_usecase/getnowplaying_usecase.dart';
import 'package:movies/Moviemoduels/pressentation/maneger/movie_bloc/movie_bloc.dart';
import 'package:movies/Moviemoduels/pressentation/maneger/movie_bloc/movie_events.dart';
import 'package:movies/Moviemoduels/pressentation/maneger/movie_bloc/movie_states.dart';
// import 'package:movies/core/locator/service_locator.dart';
//
// class MovieScreen extends StatelessWidget {
//   const MovieScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (Context) => MovieBloc(getNowPlaying: getit<GetNowPlaying>())..add(GetNowPlayingMovieEvent()),
//       lazy: false,
//       child: BlocBuilder<MovieBloc, MovieStates>(
//           builder: (context, states) {
//             print(states);
//         return SafeArea(child: Scaffold());
//       }),
//     );
//   }
// }
