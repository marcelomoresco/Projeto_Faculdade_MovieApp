import 'package:flutter/material.dart';
import '../../domain/movies/entities/movies.dart';
import '../utils/api_utils.dart';

class CustomListCard extends StatelessWidget {
  final Movie movie;
  const CustomListCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black54,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: Hero(
                    tag: movie.id,
                    child: Image.network(
                      API.REQUEST_IMG(movie.posterPath),
                      loadingBuilder: (_, child, progress) {
                        if (progress == null) {
                          return child;
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: Theme.of(context).textTheme.headline6,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                        Spacer(),
                        Text('Popularidade: ' + movie.popularity.toString()),
                        const SizedBox(height: 10),
                        Text('Votos: ' + movie.voteAverage.toString()),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
