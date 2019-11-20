import 'package:flutter/material.dart';


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 12),
          padding: EdgeInsets.fromLTRB(5, 4, 0, 4),
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: Colors.white30,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: Row(
            children: <Widget>[ 
              Icon(Icons.search,
                color: Colors.white54,
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 8, 0)),
              Expanded(
                child: Text('Search by tag, location, user',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 18.0
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
                showSearch(context: context, delegate: DataSearch());
            },
          ),
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {

  final recent = [
    'Amritsar',
    'Water Pollution',
    'Patiala',
    'Stuble Burning'
  ];

  final problems = [
    'Amritsar',
    'Water Pollution',
    'Air Pollution',
    'Noise Pollution',
    'Patiala',
    'Stuble Burning',
    'Waste Mismanagement',
    'Pits',
    'Damaged Roads',
    'Deforestation',
    'Drainage',
    'Animals',
    'Delhi',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query = "";
      },),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?recent:problems.where((p)=>p.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: (){
            showResults(context);
          },
          leading: Icon(Icons.local_activity),
          title: RichText(
            text: TextSpan(
              text: suggestionList[index].substring(0,query.length),
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: suggestionList.length,
    );
  }

}