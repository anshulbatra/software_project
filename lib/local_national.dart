import 'package:flutter/material.dart';

import 'post.dart';

class LocalNational extends StatefulWidget {
  @override
  _LocalNationalState createState() => _LocalNationalState();
}

class _LocalNationalState extends State<LocalNational> {
  @override
  Widget build(BuildContext context) {
    return 
    
      DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Row(
                    children: <Widget>[
                      Icon(Icons.location_on, color: Colors.white,),
                      SizedBox(width: 16.0,),
                      PopupMenuButton(
                        child: Row(
                          children: <Widget>[
                            Text('Patiala'),
                            Icon(Icons.keyboard_arrow_down, color: Colors.white),
                          ],
                        ),
                        itemBuilder: (BuildContext context)=><PopupMenuItem<int>>[
                          PopupMenuItem(
                            child: Text('Amritsar'),
                            value: 0,
                          ),
                          PopupMenuItem(
                            child: Text('Patiala'),
                            value: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                centerTitle: false,
                expandedHeight: 150,
                floating: true,
                pinned: false,
                snap: true,
                backgroundColor: Colors.black87,
                iconTheme: IconThemeData(
                  color: Colors.white,
                  size: 20.0
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text('Behtar Bharat',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20.0
                    ),
                  ),
                  background: Image(
                    image: NetworkImage("https://image.freepik.com/free-vector/indian-flag-made-with-lights-background_1017-20002.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    indicatorColor: Colors.white54,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(icon: Icon(Icons.info), text: "LOCAL"),
                      Tab(icon: Icon(Icons.cloud_circle), text: "NATIONAL"),
                    ],
                  ),
                ),
                pinned: true,
                //floating: true,
              ),
            ];
          },
          body: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.black,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Post();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.black,
      margin: EdgeInsets.all(0),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
      
      