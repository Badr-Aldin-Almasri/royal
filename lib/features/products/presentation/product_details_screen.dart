part of '../products.dart';


class ProductDetailsScreen extends StatelessWidget {
  final ProductsModel productsModel;
  const ProductDetailsScreen({super.key, required this.productsModel});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child:  Container(
          padding: const EdgeInsets.all(8),
          height: 150,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(width: 300,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          autoPlayInterval: const Duration(seconds: 3),
                        ),
                        items: productsModel.images.map((item) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(item, fit: BoxFit.cover),
                          ),
                        )).toList(),)),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text(productsModel.title,overflow: TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold),)),
                            Text(productsModel.price.toString()),
                            const Text(' AED'),
                          ],
                        ),
                        SizedBox(
                            height: 50,
                            child: Row(
                              children: [
                                Image.network(productsModel.category.image),
                                SizedBox(width: 5,),
                                Text(productsModel.category.name.toString()),
                              ],
                            )),
                        Text(productsModel.description),
                        ElevatedButton(onPressed: (){
                          context.read<CartCubit>().addToCart(productsModel);
                        }, child: Text("Buy Now"))
                      ],
                    ),
                  ),
                ],
              ),
              Align(alignment: Alignment.topLeft,child: CircleAvatar(backgroundColor: Colors.white,child: BackButton(),),)

            ],
          ),
        ),
      ),
    );
  }
}
