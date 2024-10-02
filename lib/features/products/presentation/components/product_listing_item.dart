part of '../../products.dart';


class ProductListingItem extends StatelessWidget {
  final ProductsModel productsModel;
  const ProductListingItem({super.key, required this.productsModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child:InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: (){
          context.pushNamed(RouteConstants.productDetails,extra: productsModel);
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 150,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              SizedBox(width: 150,
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
                    Text(productsModel.description,overflow: TextOverflow.ellipsis,maxLines: 4,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
