import 'package:flutter/material.dart';

import 'post_tags.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width*0.9;    
    return Container(
      height: 395.0,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white30,
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1rIHEq4QPVPjFKZHCIyM4fGLOZH6x-0jF80NPPjlKHPQPoXdYMA'),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Anshul Batra',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Level 4 Contributor',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuButton<int>(
                //onSelected: (int result) {setState(() { _selection = result; });},
                icon: Icon(Icons.more_vert,
                  color: Colors.white,
                ),
                elevation: 4,
                 offset: Offset(0, 100),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                  PopupMenuItem(
                    value: 1,
                    child: Text("Share"),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text("Add more to Title"),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Text("Report"),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 5.0),
            //padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: cWidth,
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Text('post title xnlcnqwwcncnlknscn cjcno sdbjcbc sjninf jqwniwfn kfnfnqf fnkfn kefn knfkef knk nckw wknwk dknm wlqcmcj kcmmlc lcmwql'),
                ),
                Container(
                  alignment: Alignment(0.9, 60),
                  child: InkWell(
                    onTap: (){},
                    child: Text('...Read More',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                
                Row(
                  children: <Widget>[
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Image(
                          fit: BoxFit.fill,
                          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1XDZ1Mg1NnikI87YVZTc0CSmpVuqDDv9sJ1cIiJ18z3V10L2aIg'),
                        ),
                      ),
                      margin: EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 5.0),
                      height: 80.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Image(
                          fit: BoxFit.fill,
                          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1XDZ1Mg1NnikI87YVZTc0CSmpVuqDDv9sJ1cIiJ18z3V10L2aIg'),
                        ),
                      ),
                      margin: EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 5.0),
                      height: 80.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Image(
                          fit: BoxFit.fill,
                          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1XDZ1Mg1NnikI87YVZTc0CSmpVuqDDv9sJ1cIiJ18z3V10L2aIg'),
                        ),
                      ),
                      margin: EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 5.0),
                      height: 80.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Image(
                          fit: BoxFit.fill,
                          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1XDZ1Mg1NnikI87YVZTc0CSmpVuqDDv9sJ1cIiJ18z3V10L2aIg'),
                        ),
                      ),
                      margin: EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 5.0),
                      height: 80.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Image(
                          fit: BoxFit.fill,
                          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1XDZ1Mg1NnikI87YVZTc0CSmpVuqDDv9sJ1cIiJ18z3V10L2aIg'),
                        ),
                      ),
                      margin: EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 5.0),
                      height: 80.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Image(
                          fit: BoxFit.fill,
                          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1XDZ1Mg1NnikI87YVZTc0CSmpVuqDDv9sJ1cIiJ18z3V10L2aIg'),
                        ),
                      ),
                      margin: EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 5.0),
                      height: 80.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0),),
                      Text('435',
                      style: TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(3.0, 0, 0, 0),
                      ),
                      Icon(
                        Icons.star_half,
                        color: Colors.white,
                      ),
                    ], 
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0),),
                      InkWell(
                        highlightColor: Colors.grey,
                        child: Icon(
                          Icons.arrow_upward,
                          color: Colors.white,
                        ),
                        onTap: () {},
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(8, 0, 0, 0),),
                      InkWell(
                        child: Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                //Tags here
                child: Container(
                  margin: EdgeInsets.fromLTRB(3, 19, 3, 10),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return PostTag();
                    },
                  ),
                ),
              ),
              Column(),

            ],
          ),
        ],
      ),
    );
  }
}