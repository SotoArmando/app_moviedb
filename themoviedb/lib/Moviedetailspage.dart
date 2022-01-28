import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Moviedetailspage extends StatefulWidget {
  const Moviedetailspage({Key? key}) : super(key: key);

  @override
  _MoviedetailspageState createState() => _MoviedetailspageState();
}

class _MoviedetailspageState extends State<Moviedetailspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            height: 100,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
