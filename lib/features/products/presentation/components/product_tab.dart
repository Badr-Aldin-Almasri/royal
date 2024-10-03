import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class ProductTab extends StatelessWidget {
  const ProductTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 130,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(
          children: List.generate(
              5,
              (index) => Positioned(
                    left: index * (MediaQuery.sizeOf(context).width / 5),
                    bottom: index * 15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Color(0xff353F54),
                              Color(0xff222834),
                            ])),
                        width: 50,
                        height: 50,
                        child: Icon(Icons.add,color: Colors.white,),
                      ),
                    ),
                  )).toList(),
        ),
      ),
    );
  }
}
