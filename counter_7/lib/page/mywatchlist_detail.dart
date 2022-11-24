import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/model/movie.dart';
import 'package:intl/intl.dart';

class MyWatchListDetail extends StatelessWidget {
  final Movie movie;
  const MyWatchListDetail({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
        ),
        drawer: CustomDrawer(),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            children: [
              Center(
                  child: Text(
                    movie.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)
                  ),
              ),
              const SizedBox(
                height: 28,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Release Date: ",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        DateFormat('MMM d, yyyy').format(DateTime.parse(movie.releaseDate)),
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Rating: ",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        "${movie.rating.toString()}/5",
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Status: ",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        movie.watched ? "watched" : "not watched",
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: const Text(
                      "Review: ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Wrap(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          movie.review,
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const Spacer(),
              Align(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Back",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ]
          ),
        )
    );
  }
}