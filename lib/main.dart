import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Contador de Pessoas', home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _peopleCount = 0;
  String _info = 'Pode entrar!';

  void _setInfo() {
    String newText = _peopleCount > 19 ? 'Não pode entrar' : 'Pode entrar!';

    if (newText != _info){
      setState(() {
        _info = newText;
      });
    }
  }

  void _setPeopleCount(int count) {
    if (count > 20 || count < 0) return;
      setState(() {
        _peopleCount = count;
      });
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'images/restaurant.jpg',
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pessoas: $_peopleCount',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    onPressed: () {
                      _setPeopleCount(_peopleCount - 1);
                      _setInfo();
                    },
                    child: Text(
                      '-1',
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    onPressed: () {
                      _setPeopleCount(_peopleCount + 1);
                      _setInfo();
                    },
                    child: Text(
                      '+1',
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              _info,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.00),
            )
          ],
        ),
      ],
    );
  }
}
