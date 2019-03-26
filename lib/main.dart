import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      title: "myApp",
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    )
);
class MyApp extends StatefulWidget {
  @override
  details createState() => details();
}
class details extends State<MyApp>{
  @override
  bool pressAttention1 = false;
  bool pressAttention2 = false;
  bool pressAttention3 = false;
  String dropdownValue = null;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Details"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          SizedBox(height: 10.0,),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Name",
              hintText: "Enter your name",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                minWidth: 100.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  child: Text("Male", style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                  color: pressAttention3 ? Colors.grey : Colors.blue,
                  onPressed: () => _changecolor3(),
                ),
              ),
              SizedBox(width: 20.0,),
              ButtonTheme(
                minWidth: 100.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  child: Text("Female", style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                  onPressed: () => _changecolor2(),
                  color: pressAttention2 ? Colors.grey : Colors.blue,
                ),
              ),
              SizedBox(width: 20.0,),
              ButtonTheme(
                minWidth: 100.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  child: Text("Others", style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                  color: pressAttention1==true ? Colors.grey : Colors.blue,
                  onPressed: () => _changecolor1(),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          DropdownButton<String>(
            iconSize: 30.0,
            isExpanded: true,
            hint: Text("City"),
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
            value: dropdownValue,
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['Kolkata', 'Mumbai', 'Delhi', 'Chennai'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 15.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ],
      ),
    );
  }
  _changecolor1(){
    setState(() {
      pressAttention1 = !pressAttention1;
      pressAttention2=false;
      pressAttention3=false;
    });
  }
  _changecolor2(){
    setState(() {
      pressAttention2 = !pressAttention2;
      pressAttention1=false;
      pressAttention3=false;
    });
  }
  _changecolor3(){
    setState(() {
      pressAttention3 = !pressAttention3;
      pressAttention2=false;
      pressAttention1=false;
    });
  }
}