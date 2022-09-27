import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../components/API/Api.dart';
import '../constant.dart';

void main() async {
  runApp(const AnimeApp());
}

class AnimeApp extends StatefulWidget {
  static const id = 'AnimeApp';
  const AnimeApp({Key? key}) : super(key: key);

  @override
  _AnimeAppState createState() => _AnimeAppState();
}

class _AnimeAppState extends State<AnimeApp> {
  late Future<List<Show>> shows;

  Future<List<Show>> fetchShows() async {
    final response =
        await http.get(Uri.parse('https://api.jikan.moe/v3/top/anime/1'));

    if (response.statusCode == 200) {
      var topShowsJson = jsonDecode(response.body)['top'] as List;
      return topShowsJson.map((show) => Show.fromJson(show)).toList();
    } else {
      throw Exception('Failed to load shows');
    }
  }

  @override
  void initState() {
    super.initState();
    shows = fetchShows();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime app',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(title: const Text('Anime app')),
        body: Center(
          child: FutureBuilder(
            builder: (context, AsyncSnapshot<List<Show>> snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      right: 50, bottom: 20),
                                  child: Image(
                                      image: NetworkImage(
                                          '${snapshot.data?[index].imageUrl}')),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    '${snapshot.data?[index].title}',
                                    style: Titlestyle,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    'Score: ${snapshot.data?[index].score}',
                                    style: Titlestyle,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong :('));
              }

              return const CircularProgressIndicator();
            },
            future: shows,
          ),
        ),
      ),
    );
  }
}
