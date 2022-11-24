import 'package:counter_7/fetch_movie.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/page/mywatchlist_detail.dart';

class MyWatchList extends StatefulWidget {
  const MyWatchList({super.key});

  @override
  State<MyWatchList> createState() => _MyWatchListState();
}

class _MyWatchListState extends State<MyWatchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        drawer: const CustomDrawer(),
        body: FutureBuilder(
            future: fetchMovie(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Watch list masih kosong :(",
                        style: TextStyle(
                            color: Color(0xff59A5D8),
                            fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(7.0),
                            color: snapshot.data![index].watched
                                ? Colors.lightGreen
                                : Colors.redAccent,
                            child: ListTile(
                              title:
                              Text(snapshot.data![index].title),
                              trailing: Checkbox(
                                activeColor: Colors.limeAccent,
                                checkColor: Colors.black,
                                value: snapshot.data![index].watched,
                                onChanged: (bool? value) {
                                  setState(() {
                                    snapshot.data![index].watched = value!;
                                  });
                                },
                              ),
                              onTap: () {
                                // Route menu ke halaman detail
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MyWatchListDetail(
                                            movie: snapshot.data![index],
                                          ),
                                    ));
                              },
                            )
                        ),
                      )
                  );
                }
              }
            }
        )
    );
  }
}