
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/models/movie_models.dart';
import 'package:movie_app/pages/movie_detail_page.dart';

class ItemMovieListWidget extends StatelessWidget {
  final MovieModel movieModel;
  const ItemMovieListWidget({super.key,  required this.movieModel});

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetailPage(movieId: movieModel.id,)));
      },


      child: ClipRRect(
        child: Container(
          margin: const EdgeInsets.symmetric(
              vertical: 10.0, horizontal: 14.0),
          width: double.infinity,
          height: height * 0.7,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://image.tmdb.org/t/p/w500${movieModel.posterPath}",
              ),
            ),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        movieModel.originalTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        movieModel.overview,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.thumb_up_alt,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                movieModel.voteCount.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.date_range,
                                color: Colors.white,
                              ),
                              SvgPicture.asset(
                                "assets/icons/heart.svg",
                                height: 30.0,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                movieModel.releaseDate.toString().substring(1, 10),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    movieModel.voteAverage.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


