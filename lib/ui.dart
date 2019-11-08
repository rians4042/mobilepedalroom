import 'dart:developer';
import 'package:mobilepedalroom/core/model/movie_response.dart';
import 'package:mobilepedalroom/core/service.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class HomeScreen extends StatefulWidget { 
  @override
  _HomeScreenState createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen> {

  Service _service;

  @override
  void initState() {
    print('init HomeScreen');
    _service = Service();
    // TODO: implement initState
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(),
  body: FutureBuilder<MovieResponse>(
    future: _service.getNowPlaying(),
    builder: (context,snapshoot){
      
if(snapshoot.hasData){
  return ListView.builder(
    itemCount: snapshoot.data.results.length,
    itemBuilder: (context,index){
      return Text(snapshoot.data.results[index].title);
    },
  );
}else
      return Text('bar');
    },
  ),
);
  }
  
}