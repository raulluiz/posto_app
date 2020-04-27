import 'package:flutter/material.dart';

class ListTileArray extends StatefulWidget {
  final Future<List> array;
  ListTileArray({this.array});

  @override
  _ListTileArrayState createState() => _ListTileArrayState();
}

class _ListTileArrayState extends State<ListTileArray> {
  bool loading = true;

  get listArray => null;

  _TestListState() {
    widget.array.then((List value) {
      // loop through the json object
      for (var i = 0; i < value.length; i++) {
        // add the ListTile to an array
        listArray.add(new ListTile(title: new Text(value[i].name)));
      }

      //use setState to refresh UI
      setState(() {
        loading = false;
      });
    });


    @override
    Widget build(BuildContext context) {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}