import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../domain/movies/entities/movies.dart';
import '../../components/custom_list_card.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  /*final MoviesRepository moviesRepository = MoviesRepositoryImp(
    DioServiceImp(),
  );
  final MovieController _movieController = MovieController(
    MoviesCacheDecorator(
      MoviesRepositoryImp(
        DioServiceImp(),
      ),
    ),
  );*/

  @override
  Widget build(BuildContext context) {
    return Container();

    /*Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(28.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            ValueListenableBuilder<Movies?>(
              valueListenable: _movieController.movies,
              builder: (_, movies, __) {
                return Visibility(
                  visible: movies != null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Movies",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: _movieController.onChanged,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search_outlined),
                          border: OutlineInputBorder(),
                          hintText: 'Search Your Movie',
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            ValueListenableBuilder<Movies?>(
              valueListenable: _movieController.movies,
              builder: (_, movies, __) {
                return _movieController != null
                    ? ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: movies!.listMovies.length,
                        itemBuilder: (_, index) =>
                            CustomListCard(movie: movies.listMovies[index]),
                        separatorBuilder: (_, __) => const Divider(),
                      )
                    : Center(child: Lottie.asset('assets/lottie_movie.json'));
              },
            ),
          ],
        ),
      ),
    ))*/
  }
}
