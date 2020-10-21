import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:myapp/model.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  Future<IPModel> future() async {
    http.Response response = await http.get('http://ipapi.co/json');
    if(response.statusCode == 200){
      return IPModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('failed to load data');
    }
  }  

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
          body: Center(
            child: FutureBuilder(
              future: future(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.hasData){
                  return Text('${snapshot.data.ip}\n${snapshot.data.city}\n${snapshot.data.region}\n${snapshot.data.countryName}\n${snapshot.data.org}');
                } else if (snapshot.hasError){
                    return Text('${snapshot.error}');
                } else{
                  return CircularProgressIndicator();
                }
              }
              ),
          ),
        ),
      );
  }
}
/*
class MyApp extends StatelessWidget {

  final List<String> data = [
    'One',
    'Two',
    'Three',
    'Four', 
    'Five',
    'Six',
    'Seven', 
    'Nine',
    'Ten'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    ); 
    /*
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(data[index]),
            );
          },
        ),
        /*
        body: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(Icons.ac_unit),
                title: Text('AC'),
               subtitle : Text('Air Conditioner'),
              ),
            ),
              ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('Bank'),
              subtitle: Text('Money Saving'),
            ),
              ListTile(
              leading: Icon(Icons.android),
              title: Text('Android'),
              subtitle: Text('Android'),
            ),
          ],
        )*/
       /* body: Center( 
          child: Card(
            margin: EdgeInsets.all(10),
            child: Image.network('https://cdn.discordapp.com/attachments/268028529382391811/749727017351512064/unknown.png'),
          ), */
          /*
          child: RaisedButton(
            child: Text('Kod Kod!'),
            onPressed: () {
              print('Button Pressed!');
            },
          ),*/
          /* child: Container(
            padding: EdgeInsets.all(100),
            child: Text('TEST!'),
          ) 
          // child: Image.network('https://cdn.discordapp.com/attachments/268028529382391811/749727017351512064/unknown.png'),
          // child: Image.asset('images/81O7HcItlaL._SL1500_.jpg'),
        )*/
      ),
    );*/
  }
} 

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Go To Second Page'),
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => SecondPage(),
                  ),
                );
              },
              ),
            RaisedButton(
              child: Text('Go To Third Page'),
              onPressed: () {}, 
              ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Go To Third Page'),
              onPressed: () {
                 Navigator.push(context, 
                 MaterialPageRoute(
                  builder: (context) => ThirdPage(),
                  ),
                );
              },
              ),
            RaisedButton(
              child: Text('Go To First Page'),
              onPressed: () {
                Navigator.push(context, 
                 MaterialPageRoute(
                  builder: (context) => FirstPage(),
                  ),
                );
              }, 
              ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Back To First Page'),
              onPressed: () {
                Navigator.push(context, 
                 MaterialPageRoute(
                  builder: (context) => FirstPage(),
                  ),
                );
              },
              ),
            RaisedButton(
              child: Text('Back To Second Page'),
              onPressed: () {
               Navigator.push(context, 
                 MaterialPageRoute(
                  builder: (context) => SecondPage(),
                  ),
                );
              }, 
              ),
          ],
        ),
      ),
    );
  }
}

*/