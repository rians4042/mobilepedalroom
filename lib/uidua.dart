import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilepedalroom/core/model/movie_response.dart';
import 'package:mobilepedalroom/core/service.dart';

class HomeScreendua extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreendua> {
  Service _service;
  var imageUrl = 'http://image.tmdb.org/t/p/w500';

  @override
  void initState() {
    print('init HomeScreen');
    _service = Service();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<MovieResponse>(
          future: _service.getNowPlaying(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.results.length,
                itemBuilder: (context, index) {
                  print(imageUrl + snapshot.data.results[index].posterPath);

                  ///Tambahin ini
                  var data = snapshot.data.results[index];

                  if (snapshot.data.results.length == null) {
                    return Text('Tidak Ada Data');
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 150,
                            width: 100,
                            child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: Image.network(imageUrl + data.posterPath)),
                          )
                        ],
                      ),
                    );
                  }
                },
              );
            } else {
              return Text('BA');
            }
          }),
    );
  }
}