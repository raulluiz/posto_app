import 'package:flutter/material.dart';

class ClienteNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        /*Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>ChamadoView())
        );*/
      },
      child: Card(
          elevation: 3.0,
          child: Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: makeListTile,
          )
      ),
    );
  }

  final makeListTile = ListTile(

      title: Text(
        "YPETRO DISTRIBUIDORA DE COMBUSTIVEIS S/A",
        style: TextStyle(color: Colors.white),
      ),
      trailing:  Icon(Icons.delete,color: Colors.white70,)
  );
}
