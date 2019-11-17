import 'package:flutter/material.dart';

class PostTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0.0, 0.0),
      margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      width: 40.0,
      height: 2.0,
      
      decoration: BoxDecoration(
        color: Colors.black12,
        border: Border.all(
          width: 0,
          color: Colors.black12,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      child: Text('tag',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}