
part of 'route_import.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name:'/',
        pageBuilder: (context, state) {
          return getTransition(
            state: state,
           child: const ProductsListingScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.productDetails,
        path: '/${RouteConstants.productDetails}',
        pageBuilder: (context, state) {
          return getTransition(
            state: state,
            child: ProductDetailsScreen(productsModel: state.extra! as ProductsModel),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.cartScreen,
        path: '/${RouteConstants.cartScreen}',
        pageBuilder: (context, state) {
          return getTransition(
            state: state,
            child: CartListingView(),
          );
        },
      ),
    ],
  );
  GoRouter get router => _router;
}

Page<dynamic> getTransition({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    name: state.name.toString(),
    arguments: state.pathParameters,
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child,) {
      return SlideTransition(
        position: animation.drive(
          Tween(begin: const Offset(1, 0), end: Offset.zero).chain(
            CurveTween(curve: Curves.easeIn),
          ),
        ),
        child: child,
      );
    },
  );
}
