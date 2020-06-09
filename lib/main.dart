import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text('CSV Reader'),
          backgroundColor: Colors.teal.shade900,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftButtonImage = 1;
  int rightButtonImage = 1;

  List<DropdownMenuItem<String>> menuItems = List();

  String value = '';
  final sust = {'T-A': 'T-A', 'T-B': 'T-B'};
  final sau = {'T-A': 'T-A', 'T-B': 'T-B'};
  final sec = {'T-A': 'T-A', 'T-B': 'T-B'};
  bool disabledDropDown = true;

  void populatesust() {
    for (String key in sust.keys) {
      menuItems.add(
        DropdownMenuItem<String>(
          value: sust[key],
          child: Center(
            child: Text(sust[key]),
          ),
        ),
      );
    }
  }

  void populatesau() {
    for (String key in sau.keys) {
      menuItems.add(
        DropdownMenuItem<String>(
          value: sau[key],
          child: Center(
            child: Text(sec[key]),
          ),
        ),
      );
    }
  }

  void populatesec() {
    for (String key in sec.keys) {
      menuItems.add(
        DropdownMenuItem<String>(
          value: sec[key],
          child: Center(
            child: Text(sec[key]),
          ),
        ),
      );
    }
  }

  void valueChanged(_value) {
    print('The Value changed to: $_value');

    if (_value == 'Sust') {
      populatesust();
    } else if (_value == 'Sau') {
      populatesau();
    } else if (_value == 'Sec') {
      populatesec();
    }

    setState(() {
      value = _value;
      disabledDropDown = false;
    });
  }

  void disabledDropDownValueChanged(_value) {
    setState(() {
      value = _value;
      disabledDropDown = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: DropdownButton<String>(
              items: [
                DropdownMenuItem<String>(
                  value: 'Sust',
                  child: Center(child: Text('Sust')),
                ),
                DropdownMenuItem<String>(
                  value: 'Sau',
                  child: Center(child: Text('Sau')),
                ),
                DropdownMenuItem<String>(
                  value: 'Sec',
                  child: Center(child: Text('Sec')),
                ),
              ],
              onChanged: (_value) {
                valueChanged(_value);
                print(_value);
                Text('_value');
              },
              hint: Text(
                'Select Universities',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: DropdownButton<String>(
              items: menuItems,
              onChanged: disabledDropDown
                  ? null
                  : (_value) {
                      disabledDropDownValueChanged(_value);
                    },
              hint: Text(
                'Pick A Teacher\'s Name',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              disabledHint: Text('First Select Any University'),
            ),
          ),
          Text('$value'),
        ],
      ),
    );
  }
}
