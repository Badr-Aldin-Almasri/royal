part of '../products.dart';

class ProductsListingScreen extends StatefulWidget {
  const ProductsListingScreen({super.key});

  @override
  State<ProductsListingScreen> createState() => _ProductsListingScreenState();
}

class _ProductsListingScreenState extends State<ProductsListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242C3B),
      appBar:AppBar(
        title: Text("Shoose Your Product",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Color(0xff242C3B),
        actions: [
          Container(
            height: 45,
            width: 45,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),gradient: LinearGradient(
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
            colors: [
              Color(0xff37B6E9),
              Color(0xff4B4CED),
            ])),
            child: Icon(Icons.search,color: Colors.white,size: 30,),
          ),SizedBox(width: 20,)
        ],),
      body: SafeArea(
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.errorMessage != null) {
              return Center(
                child: Text(state.errorMessage!),
              );
            } else if (state.productsData.isNotEmpty){
              return Stack(
                children: [
                  SizedBox.expand(
                    child: ClipPath(
                      clipper: BackgroundClipper(),
                      child: Container(
                        decoration: BoxDecoration(gradient: LinearGradient(
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                            colors: [
                              Color(0xff37B6E9),
                              Color(0xff4B4CED),
                            ])),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 335,
                          child: Stack(
                            key: Key(Random().nextInt(99999).toString()),
                            children: [
                              Positioned(
                                  top: 205,
                                  child: ProductTab()),
                              Align(
                                  alignment: Alignment.topCenter,
                                  child: ProductTop()),
                            ],
                          ),
                        ),
                        ProductList(productsData:state.productsData)
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 60,
                              color: Color(0xff313a6a),
                              child: Row(
                                children: List.generate(5, (index)=>Expanded(child: Icon(Icons.add,color: Colors.white,))),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 5,
                              right: MediaQuery.sizeOf(context).width/5*3,
                              child: ClipPath(
                                  clipper: BottomNavClipper(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),gradient: LinearGradient(
                                        end: Alignment.bottomCenter,
                                        begin: Alignment.topCenter,
                                        colors: [
                                          Color(0xff37B6E9),
                                          Color(0xff4B4CED),
                                        ])),
                                    height: 75,width: MediaQuery.sizeOf(context).width/5,child: Icon(Icons.add,color: Colors.white,),)))
                        ],
                      ),
                    ),
                  )
                ],
              );
            }else{
              return const Center(child: Text("Something went wrong"),);
            }
          },
        ),
      ),
    );
  }


}

class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 30);
    path.quadraticBezierTo(0, 20, 8, 20);
    path.lineTo(size.width - 10, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 10);
    path.lineTo(size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height / 1.40, size.width - 5, size.height / 1.40);
    path.lineTo(10, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - 10);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}




class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path..moveTo( size.height*0.40 , size.height*0.10)
    ..lineTo(size.width , size.height/4)
    ..lineTo(size.width, size.height )
    ..lineTo(0, size.height)
    ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


