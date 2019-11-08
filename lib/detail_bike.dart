import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class DetailBike extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
     return Scaffold(
      
       
       /*appBar: AppBar(
         backgroundColor: Colors.transparent,
         elevation: 0.0,
         leading: Builder(
           builder: (BuildContext context) {
             return IconButton(
               icon: const Icon(Icons.menu),
               onPressed: (){Scaffold.of(context).openDrawer();},
               tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
             );
           }
         ),
       ),*/
body: DefaultTabController(
  length: 2,
  child:   NestedScrollView(
  
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Bishop",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Container(
                      child: Carousel(
                        images: [
                           Image.network(
                          'https://www.pedalroom.com/p/bishop-bespoke-track-bike-26074_10.jpg',
                      fit: BoxFit.cover,
                    ),
                      Image.network(
                          'https://www.pedalroom.com/p/bishop-bespoke-track-bike-26074_8.jpg',
                      fit: BoxFit.cover,
                    ),
                        ],
                      ),
                    )),
                    
              ),
              SliverPadding(
                padding: EdgeInsets.all(16.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    TabBar(
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      tabs: <Widget>[
                        Tab(icon: Icon(Icons.assignment),text: 'Specification'),
                        Tab(icon: Icon(Icons.face),text: 'Rider')
                      ],
                    ),
  
                  ]),
                ),
              )
  
            ];
  
          },
  
          body: Center(
  
            child: TabBarView(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Text("Frame"),
                      Text('rims')
                    ],
                  )
                ),
                Icon(Icons.print)
              ],
            ),
  
          ),
  
        ),
),
    );
    
  }


}