import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_details/Bloc/movie_bloc.dart';
import 'package:movie_details/Repository/ModelClass/MovieModel.dart';
import 'package:movie_details/UI/Screens/DetailsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late MovieModel movies;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<MovieBloc>(context).add(FetchMovies());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Moviezzzz"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MoviesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is MoviesError) {
              return const Center(
                child: Text("OOPS.. Something went wrong..."),
              );
            }
            if (state is MoviesLoaded) {
              movies = BlocProvider.of<MovieBloc>(context).movieModel;
              return GridView.builder(
                itemCount: movies.results!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (itemWidth / itemHeight),
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailsScreen(
                                description: movies.results![index].synopsis.toString(),
                                image: movies.results![index].imageurl!.first
                                    .toString(),
                                year: movies.results![index].released,
                                tittle:
                                    movies.results![index].title.toString(),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 250,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(10)),
                          child: movies.results![index].imageurl!.isEmpty
                              ? Image.asset(
                                  "assets/placeholder.png",
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  movies.results![index].imageurl!.first
                                      .toString()
                                      .toString(),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      movies.results![index].title == null
                          ? const Text("no data")
                          : Text(movies.results![index].title.toString()),
                    ],
                  );
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
