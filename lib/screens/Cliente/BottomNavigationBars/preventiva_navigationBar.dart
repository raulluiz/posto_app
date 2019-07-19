import 'package:flutter/material.dart';

import '../preventivaView_screen.dart';

class PreventivaNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>PreventivaView())
        );
      },
      child: Card(
          elevation: 3.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: makeListTile,
          )
      ),
    );
  }

  final makeListTile = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 2.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Text("000001",style: TextStyle(color: Colors.white),),
      ),
      title: Text(
        "DC-15680612",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        "15/06/2019",
        style: TextStyle(color: Colors.white),
      ),
      trailing: Text("Fechado", style: TextStyle(color: Colors.white),)
  );
}
