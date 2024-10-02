import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:royal/core/route/route_import.dart';
import 'package:royal/features/auth/services/auth_service.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Text("Wellcome to royal application"),
              Spacer(),
              ElevatedButton(
                  onPressed: () async {
                    AuthService _authService = GetIt.I.get<AuthService>();
                    final result = await _authService.signInWithGoogle();
                    result.fold(
                      (failure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: ${failure.errorStatus}')),
                        );
                      },
                      (user) {
                        context.pushReplacementNamed(RouteConstants.productListing);
                      },
                    );
                  },
                  child: Text("Login")),
              ElevatedButton(onPressed: (){
                context.pushReplacementNamed(RouteConstants.productListing);
              }, child: Text("Skip")),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
