import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import 'login_page.dart';
import 'movie_detail_page.dart';
import 'saved_movie_page.dart';

class MovieListPage extends StatefulWidget {

  final String username;

  static List<MovieModel> savedMovies = [];

  const MovieListPage({super.key, required this.username});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {

  void toggleSave(MovieModel movie){
    setState(() {
      if(MovieListPage.savedMovies.contains(movie)){
        MovieListPage.savedMovies.remove(movie);
      }else{
        MovieListPage.savedMovies.add(movie);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 

        leading: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Loginpage(),
                    ),
                  );
                },
        ),
        title: Text("Welcome, ${widget.username}!"),

        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SavedMoviePage(),
                ),
              );
            },
          )
        ],
      ),

      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {

          final movie = movieList[index];

          return Card(
            margin: const EdgeInsets.all(10),

            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailPage(movie: movie),
                  ),
                );
              },

              child: Padding(
                padding: const EdgeInsets.all(10),

                child: Row(
                  children: [

                    /// Poster
                    Image.network(
                      movie.imgUrl,
                      width: 80,
                      height: 100,
                      fit: BoxFit.cover,
                    ),

                    const SizedBox(width: 12),

                    /// Info Film
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "${movie.title} (${movie.year})",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(movie.genre),

                          const SizedBox(height: 5),

                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.orange, size: 18),
                              const SizedBox(width: 4),
                              Text("${movie.rating}/10")
                            ],
                          )
                        ],
                      ),
                    ),

                    /// Bookmark
                    IconButton(
                      icon: Icon(
                        MovieListPage.savedMovies.contains(movie)
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        color: MovieListPage.savedMovies.contains(movie) ? Colors.blue : null,
    
                      ),
                      onPressed: (){
                        toggleSave(movie);
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}