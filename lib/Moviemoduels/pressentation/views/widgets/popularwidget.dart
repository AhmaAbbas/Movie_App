import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Moviemoduels/pressentation/maneger/movie_bloc/movie_bloc.dart';
import 'package:movies/core/utls/appconstants.dart';
import 'package:shimmer/shimmer.dart';


import '../../../../core/utls/requeststares.dart';
import '../../maneger/movie_bloc/movie_states.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MovieBloc,MovieStates>(
      buildWhen: (prev,current)=>prev.requestStatespopular!=current.requestStatespopular,
      builder: (context,state){
        if(state.requestStatesnowplaying==RequestStates.isloading)
        {
          return Center(child: CircularProgressIndicator(),);
        }
        else if(state.requestStatesnowplaying==RequestStates.isloaded)
        {
          return  FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.CobyWith().popularmovies.length,
                  itemBuilder: (context, index) {
                    // final movie = moviesList[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                        },
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: AppConstants.imgeurl(state.CobyWith().popularmovies[index].backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
        }
        else
          {
            return Center(
              child: SizedBox(
                height: 150,
                child: Text(state.popularmesseges),),
            );
          }

      },
    );
  }
}
