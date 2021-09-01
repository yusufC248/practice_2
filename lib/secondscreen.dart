import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
         padding: const EdgeInsets.all(16.0),
         child: Column(
           children: <Widget>[
             Image.network('https://media-cdn.tripadvisor.com/media/photo-o/11/3f/04/39/p-20171111-110220-largejpg.jpg'),
             Text("Menu Profile Dummy",
             style: TextStyle(color: Colors.black, fontSize: 20),
             ),
           ],
         ),
       ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image.network(
                'https://media-cdn.tripadvisor.com/media/photo-o/11/3f/04/39/p-20171111-110220-largejpg.jpg'),
            Text("Menu Search Dummy",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class FourthScreen extends StatelessWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image.network(
                'https://media-cdn.tripadvisor.com/media/photo-o/11/3f/04/39/p-20171111-110220-largejpg.jpg'),
            Text("Menu Keranjang Dummy",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

