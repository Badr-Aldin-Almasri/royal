part of '../products.dart';

class ProductsListingScreen extends StatefulWidget {
  const ProductsListingScreen({super.key});

  @override
  State<ProductsListingScreen> createState() => _ProductsListingScreenState();
}

class _ProductsListingScreenState extends State<ProductsListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(actions: [ElevatedButton(onPressed: (){
      context.pushNamed(RouteConstants.cartScreen);
    }, child: Text("Cart"))],),
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
              return ListView.builder(
                  itemCount: state.productsData.length,
                  itemBuilder: (context,index){
                final productsModel  = state.productsData.values.toList()[index];
                return ProductListingItem(productsModel: productsModel);
              });
            }else{
              return const Center(child: Text("Something went wrong"),);
            }
          },
        ),
      ),
    );
  }
}
