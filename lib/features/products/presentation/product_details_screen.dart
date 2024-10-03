part of '../products.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductsModel productsModel;
  const ProductDetailsScreen({super.key, required this.productsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242C3B),
      appBar: AppBar(
        backgroundColor: Color(0xff242C3B),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              context.pop();
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [
                        Color(0xff37B6E9),
                        Color(0xff4B4CED),
                      ])),
              child: Icon(
                Icons.arrow_downward,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
                width: 300,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                  items: productsModel.images
                      .map((item) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(item, fit: BoxFit.cover),
                            ),
                          ))
                      .toList(),
                )),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(0),
              height: 150,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: Color(0xff2a3141),
                  borderRadius: BorderRadius.circular(15)),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ClayContainer(
                                  borderRadius: 8,
                                  color: Color(0xff2a3141),

                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("description",style: TextStyle(color: Colors.white),),
                                  ),
                                ),ClayContainer(
                              emboss: true,
                                  borderRadius: 8,
                              color: Color(0xff2a3141),

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("specification",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                              ],
                            ),
                            Text(
                              productsModel.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(productsModel.description,style: TextStyle(color: Colors.white),),
                            Container(
                              height: 75,
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                  color: Color(0xff242C3B),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30))),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "AED ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff37B6E9)),
                                  ),
                                  Text(
                                    productsModel.price.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff37B6E9)),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      context
                                          .read<CartCubit>()
                                          .addToCart(productsModel);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          gradient: LinearGradient(
                                              end: Alignment.bottomCenter,
                                              begin: Alignment.topCenter,
                                              colors: [
                                                Color(0xff37B6E9),
                                                Color(0xff4B4CED),
                                              ])),
                                      child: Center(
                                          child: Text(
                                        "Add to Cart",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
