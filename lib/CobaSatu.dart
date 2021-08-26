import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';



class CobaSatu extends StatelessWidget{
  final String messgae = 'yusuf ganteng';
  var _url = 'https://api.whatsapp.com/send?phone=6289601776959&text=Assalamualaikum+saya+mau+pesan';
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            Container(
                child: Image.asset(
                    'images/farm-house.jpg',
                    fit: BoxFit.fitWidth,
                    height: 250,
                  width: 800,
                  ),

              ),

              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text(
                  'Farm House Lembang',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30.0
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        SizedBox(height: 8.0),
                        Text('Open Everyday'),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.access_time),
                        SizedBox(height: 8.0),
                        Text('09.00 - 20.00'),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.monetization_on),
                        SizedBox(height: 8.0),
                        Text('25.000'),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Berada di jalan utama Lampung-Lembang, Farm House menjadi baik',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                            'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                            'https://i.ibb.co/8ssq7VL/parris.jpg'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                            'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    child: Text('Pindah Screen'),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return SecondScreen(messgae);
                      }));
                    },
                  ),
                  ElevatedButton(onPressed: _launchURL,
                      child: Text("Launch Youtube"))
                ],
              ),
            ],
          ),
        )
    );
  }

  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}

class SecondScreen extends StatelessWidget {

  final String message;
  SecondScreen(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layar Kedua"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(message,
              style: TextStyle(fontSize: 26.0),
            ),
            OutlinedButton(onPressed: (){
              Navigator.pop(context);
            },
                child: Text('Kembali')
            ),
          ],
        ),
      ),
    );
  }
}