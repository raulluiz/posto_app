import 'package:flutter/material.dart';

class TecnicoNavigationBar extends StatelessWidget {
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
        "Tite de Oliveira Filho",
        style: TextStyle(color: Colors.white),
      ),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white,)
  );
}
