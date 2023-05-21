import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Moviemoduels/pressentation/maneger/movie_bloc/movie_bloc.dart';
import 'package:movies/Moviemoduels/pressentation/maneger/movie_bloc/movie_states.dart';
import 'package:movies/core/utls/appconstants.dart';
import 'package:movies/core/utls/requeststares.dart';

import '../movie_detail_screen.dart';


class GetNowPlayingwidget extends StatelessWidget {
  const GetNowPlayingwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MovieBloc,MovieStates>(
      buildWhen: (prev,current)=>prev.requestStatesnowplaying!=current.requestStatesnowplaying,
      builder: (context,state){
        print("nowplaying123");
        if(state.requestStatesnowplaying==RequestStates.isloading)
          {
            return Center(child: CircularProgressIndicator(),);
          }
        else if(state.requestStatesnowplaying==RequestStates.isloaded)
          {
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {},
                ),
                items: state.CobyWith().nowplayingmovies.map(
                      (item) {
                    return GestureDetector(
                      key: const Key('openMovieMinimalDetail'),
                      onTap: () {
                        /// TODO : NAVIGATE TO MOVIE DETAILS
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return MovieDetailScreen(id: item.id,);
                        }));
                      },
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // fromLTRB
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0, 0.3, 0.5, 1],
                              ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(
                              height: 400,
                              imageUrl: AppConstants.imgeurl(item.backdropPath),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: Colors.redAccent,
                                        size: 16.0,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        'Now Playing'.toUpperCase(),
                                        style:  AppConstants.textwhie,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Text(
                                    item.title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          }
        else
          {
            return Center(
              child: SizedBox(
                height: 150,
                child: Text(state.messegesnowplaying),),
            );
          }
      },
    );
  }
}
