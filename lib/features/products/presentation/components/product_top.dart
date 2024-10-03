import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class ProductTop extends StatelessWidget {
  const ProductTop({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: ClipPath(
        clipper: TrapeziumClipper(),
        child: Container(
          decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black12)]),
          // color: Colors.red,
          // padding: EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width,
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacer(),
              Text(
                'OFF 30%',
                style:
                TextStyle(color: Colors.grey,fontSize: 50),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ).asGlass(frosted: true,blurX: 30,blurY: 30,tintColor: Color(0xff242C3B)),
      ),
    );
  }
}

class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start at the top left corner
    path.moveTo(20, 0); // Slight curve on the top-left
    path.lineTo(size.width - 10, 0); // Top side

    // Top-right corner
    path.quadraticBezierTo(
        size.width, 0, size.width, 8); // Rounded top-right corner

    // Right side
    path.lineTo(size.width, size.height /1.25); // Right edge, slightly sloped bottom

    // Rounded bottom-right corner
    path.quadraticBezierTo(size.width, size.height/1.20, size.width - 10, size.height/1.20); // Rounded bottom-right

    // Sloped bottom from right to left
    path.lineTo(10, size.height); // Sloping the bottom side

    // Rounded bottom-left corner
    path.quadraticBezierTo(0, size.height, 0, size.height - 10); // Rounded bottom-left

    // Left side
    path.lineTo(0, 10);

    // Top-left corner
    path.quadraticBezierTo(0, 0, 8, 0); // Rounded top-left corner

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}