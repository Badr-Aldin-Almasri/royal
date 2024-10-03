import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:glass/glass.dart';
import 'package:go_router/go_router.dart';
import 'package:royal/features/products/model/products_model.dart';

import '../../../../core/route/route_import.dart';

class ProductList extends StatelessWidget {
  final Map<String, ProductsModel>  productsData;
  const ProductList({super.key, required this.productsData});

  @override
  Widget build(BuildContext context) {
    final listData = productsData.values.toList();
    return  StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: [StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 0.5,
        child: SizedBox(),
      ),...List.generate(listData.length, (index)=>item(context,index,listData[index]))],
    );
  }
  Widget item(BuildContext context,int index, ProductsModel model){
    return  StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2.5,
      child: Container(
        // color: Colors.indigo,
        // height: 150,
        child: Padding(
          padding:  EdgeInsets.only(right: 10,left: 10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width/2.4,
            // height: 200,
            child: ClipPath(
              clipper: CustomCardClipper(),
              child: InkWell(
                onTap: (){
                  context.pushNamed(RouteConstants.productDetails,extra: model);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(  begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff353F54).withOpacity(0.2),
                          Color(0xff222834).withOpacity(0.5),
                        ])
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 15,),
                      Expanded(
                        child: Center(
                          child: SizedBox(width: 150,
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                ),
                                items: model.images.map((item) => Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(item, fit: BoxFit.cover),
                                  ),
                                )).toList(),)),
                        ),
                      ),
                     Text(model.category.name,style: TextStyle(fontSize: 14,color: Colors.grey),),
                      SizedBox(height: 5,),
                     Text(model.title,style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                     SizedBox(height: 5,),
                     Text(model.price.toString(),style: TextStyle(fontSize: 14,color: Colors.grey),),
                      SizedBox(height: 10,)
                    ],
                  ),
                ).asGlass(frosted: true,blurX: 30,blurY: 30,tintColor: Color(0xff242C3B)),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
class CustomCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start at the top-left corner, creating a rounded effect
    path.moveTo(0, 50); // Starting point just before the corner

    // Top-left rounded corner
    path.quadraticBezierTo(0, 40, 8, 40); // Rounded top-left corner

    // Move along the top edge to the top-right corner
    path.lineTo(size.width - 20, 0); // Draw straight to the top-right

    // Top-right rounded corner
    path.quadraticBezierTo(size.width, 0, size.width, 20); // Rounded top-right corner

    // Right side (straight down)
    path.lineTo(size.width, size.height / 1.25); // Right edge down

    // Rounded bottom-right corner
    path.quadraticBezierTo(size.width, size.height / 1.20, size.width - 10, size.height / 1.20); // Rounded bottom-right

    // Sloped bottom from right to left
    path.lineTo(10, size.height); // Sloping the bottom side

    // Rounded bottom-left corner
    path.quadraticBezierTo(0, size.height, 0, size.height - 10); // Rounded bottom-left

    path.close(); // Close the path
    return path; // Return the created path
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

