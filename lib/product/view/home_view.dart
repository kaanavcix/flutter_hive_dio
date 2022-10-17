import 'package:flutter/material.dart';
import 'package:flutter_bloc_hive_login/core/init/cache/hive_cache.dart';
import 'package:flutter_bloc_hive_login/product/model/login_response_model.dart';
import 'package:flutter_bloc_hive_login/product/provider/initilaze_provider.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  HomeView({required this.loginResponseModel, super.key});

  LoginResponseModel loginResponseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text(loginResponseModel.token.toString()),
          ElevatedButton(
              onPressed: () {
                context.read<InitilazeProvider>().signOut();
                Navigator.of(context).pop();
              },
              child: const Text("çıkış yap"))
        ],
      )),
    );
  }
}
