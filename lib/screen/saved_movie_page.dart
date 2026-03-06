import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import 'movie_list_page.dart';

class SavedMoviePage extends StatelessWidget {
  const SavedMoviePage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<MovieModel> saved = MovieListPage.savedMovies;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Movies"),
      ),

      body: ListView.builder(
        itemCount: saved.length,
        itemBuilder: (context, index) {

          final movie = saved[index];

          return ListTile(
            leading: Image.network(movie.imgUrl, width: 50),
            title: Text(movie.title),
            subtitle: Text("${movie.year} • ${movie.genre}"),
          );
        },
      ),
    );
  }
}