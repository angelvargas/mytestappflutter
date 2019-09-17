import 'package:flutter/material.dart';
import 'package:mytestappflutter/views/home/fragments/SegundoReto.dart';
import 'package:mytestappflutter/views/home/fragments/web3j_fragment.dart';
import 'package:mytestappflutter/views/home/fragments/third_fragment.dart';
//import 'package:mytestappflutter/fragments/ethereum.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget{
  final drawerItems = [
    new DrawerItem("Segundo Reto", Icons.rss_feed),
    new DrawerItem("Dart web3", Icons.local_pizza),
    new DrawerItem("Fragment 3", Icons.info),
    new DrawerItem("Ethereum", Icons.info)
  ];

  @override
  State<StatefulWidget> createState(){
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage>{
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos){
    switch (pos) {
      case 0:
        return new SegundoReto();
      case 1:
        return new Web3jFragment();
      case 2:
        return new ThirdFragment();
      case 3:
        return new Web3jFragment();    
      default:
        return new SegundoReto();
        //return new Text("Error");
    }
  }
  _onSelectItem(int index){
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop();
  }

  void _onSelectIcon(int index){
    setState(() {
      _selectedDrawerIndex = index;
    });
    //setState(() => _selectedDrawerIndex = index);
    //Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context){
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: ()=>_onSelectItem(i),
        )
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("John Doe"), accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedDrawerIndex > 2 ? 0 : _selectedDrawerIndex,
        selectedItemColor: Colors.amber[800],
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color.fromARGB(255, 0, 0, 0) ),
            title: Text('Icono 1')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business, color: Color.fromARGB(255, 0, 0, 0) ),
            title: Text('Icono 2')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school, color: Color.fromARGB(255, 0, 0, 0) ),
            title: Text('Icono 2')
          ),
        ],
        onTap: (index){
          _onSelectIcon(index);
        },
      )
    );
  }
}