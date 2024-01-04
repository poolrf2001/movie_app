import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_detail_model.dart';
import 'package:movie_app/ui/widgets/item_cast_widget.dart';
import 'package:movie_app/ui/widgets/item_review_widget.dart';
import 'package:movie_app/ui/widgets/title_description_widget.dart';

import '../services/api_services.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;
  const MovieDetailPage({super.key, required this.movieId});


  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final APIServices _apiServices= APIServices();
  MovieDetailModel? movieDetailModel;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData() async{
   movieDetailModel = await _apiServices.getMovieDetail(widget.movieId);
   isLoading = false;
   setState(() {

   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1e202f),
      body: !isLoading ? CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xff1e202f),
            title: Text(
              movieDetailModel!.title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
            expandedHeight: 200.0,
            elevation: 10,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    "http://image.tmdb.org/t/p/w500${movieDetailModel!.backdropPath}",
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xff161823).withOpacity(0.2),
                          const Color(0xff161823).withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floating: false,
            snap: false,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 14.0,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 160,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "http://image.tmdb.org/t/p/w500${movieDetailModel!.posterPath}",
                              ),
                            )),
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.white54,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "2022-12-07",
                                    style: TextStyle(color: Colors.white54),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Gato con botas 2Gato con botas 2Gato con botas 2",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.timelapse,
                                    color: Colors.white54,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "103 min",
                                    style: TextStyle(color: Colors.white54),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleDescriptionWidget(
                        title: "Reseña",
                      ),
                      const Text(
                        "Secuela de 'El Gato con botas' (2011). El Gato con Botas descubre que su pasión por la aventura le ha pasado factura: ha consumido ocho de sus nueve vidas, por ello emprende un viaje épico para encontrar el mítico Último Deseo y restaurar sus nueve vidas...",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.link),
                          label: const Text("Home Page"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const TitleDescriptionWidget(title: "Géneros"),
                      const Wrap(
                        spacing: 10.0,
                        children: [
                          Chip(label: Text("Action")),
                          Chip(label: Text("Action")),
                          Chip(label: Text("Action")),
                          Chip(label: Text("Action")),
                          Chip(label: Text("Action")),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      const TitleDescriptionWidget(title: "Actores"),
                      const SizedBox(height: 10.0),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          children: [
                            ItemCastWidget(
                              avatarImage: "/iWIUEwgn2KW50MssR7tdPeFoRGW.jpg",
                              nameActor: "Antonio Banderas",
                              nameCharacter: "gato",
                            ),
                            ItemCastWidget(
                              avatarImage: "/iWIUEwgn2KW50MssR7tdPeFoRGW.jpg",
                              nameActor: "Antonio Banderas",
                              nameCharacter: "gato",
                            ),
                            ItemCastWidget(
                              avatarImage: "/iWIUEwgn2KW50MssR7tdPeFoRGW.jpg",
                              nameActor: "Antonio Banderas",
                              nameCharacter: "gato",
                            ),
                            ItemCastWidget(
                              avatarImage: "/iWIUEwgn2KW50MssR7tdPeFoRGW.jpg",
                              nameActor: "Antonio Banderas",
                              nameCharacter: "gato",
                            ),
                            ItemCastWidget(
                              avatarImage: "/iWIUEwgn2KW50MssR7tdPeFoRGW.jpg",
                              nameActor: "Antonio Banderas",
                              nameCharacter: "gato",
                            ),
                            ItemCastWidget(
                              avatarImage: "/iWIUEwgn2KW50MssR7tdPeFoRGW.jpg",
                              nameActor: "Antonio Banderas",
                              nameCharacter: "gato",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const TitleDescriptionWidget(title: "Reviews"),
                      const SizedBox(height: 16.0),
                      const ItemReviewWidget(),
                      const ItemReviewWidget(),
                      const ItemReviewWidget(),
                      const ItemReviewWidget(),
                      const SizedBox(
                        height: 200,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ) : const Center(child: CircularProgressIndicator()),
    );
  }
}
