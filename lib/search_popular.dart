import 'package:flutter/material.dart';

ThemeData pageTheme = ThemeData(
  fontFamily: 'Oxygen',
);

Color firstColor = Color(414141);
Color secondColor = Color(000000);


class CustomShapeClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height - 15);

    var firstEndPoint = Offset(size.width*0.5, size.height - 50);
    var firstControlPoint = Offset(size.width * 0.25, size.height - 70);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 85);
    var secondControlPoint = Offset(size.width * 0.75, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx , secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}

class SearchPopularScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SearchPopularUpperScreen(),
      ],
    );
  }
}

class SearchPopularUpperScreen extends StatefulWidget {
  @override
  _SearchPopularUpperScreenState createState() => _SearchPopularUpperScreenState();
}

class _SearchPopularUpperScreenState extends State<SearchPopularUpperScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 380, 
            color: Colors.black,
            /*decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  firstColor,
                  secondColor,
                ],
              ),
            ),*/
            
          ),
        ),
      ],
    );
  }
}

