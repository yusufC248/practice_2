
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_2/secondscreen.dart';
import 'package:practice_2/tourism_place.dart';
import 'detail_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget> [
    Beranda(),
    ThirdScreen(),
    FourthScreen(),
    SecondScreen(),
  ];

  void onItemTap(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: selectedIndex,
          color: Colors.blueAccent,
          backgroundColor: Colors.white,
          height: 60,
          items: <Widget>[
            Icon(Icons.home, size: 24, color: Colors.white),
            Icon(Icons.search, size: 24, color: Colors.white),
            Icon(Icons.shopping_cart, size:24, color: Colors.white),
            Icon(Icons.person, size: 24, color: Colors.white),
          ],
          animationCurve: Curves.easeInBack,
          animationDuration: const Duration(milliseconds: 280),
          onTap: onItemTap,
        ),

        body: _widgetOptions.elementAt(selectedIndex),

    );
  }
}

class Beranda extends StatelessWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wisata Bandung'),
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              if(constraints.maxWidth <= 600){
                return TourismPlaceGrid(gridCount: 2);
              } else if (constraints.maxWidth <= 1200) {
                return TourismPlaceGrid(gridCount: 4);
              }else{
                return TourismPlaceGrid(gridCount: 6);
              }
            }
        )
    );
  }
}



class TourismPlaceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index){
        final TourismPlace place = tourismPlaceList[index];
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailScreen(place: place);
            }));
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Expanded(
                  flex: 1,
                  child: Image.asset(place.imageAsset),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            place.name,
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(place.location),
                        ],

                      ),
                    ))
              ],
            ),
          ),
        );
      },
      itemCount: tourismPlaceList.length,
    );
  }
}

class TourismPlaceGrid extends StatelessWidget {
  final int gridCount;

  TourismPlaceGrid({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: tourismPlaceList.map((place) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(place: place);
                }));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset(
                        place.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        place.name,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text(
                        place.location,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}




