import 'package:flutter/material.dart';
import 'package:flutter_bloc_hive_login/core/init/cache/hive_cache.dart';
import 'package:flutter_bloc_hive_login/product/model/login_response_model.dart';
import 'package:flutter_bloc_hive_login/product/provider/initilaze_provider.dart';
import 'package:flutter_bloc_hive_login/product/view/home_view.dart';
import 'package:flutter_bloc_hive_login/product/view/login_view.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {

          var tokenAuths =  context.watch<InitilazeProvider>().checkToken();
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Scuatere",
              home: Builder(
                builder: (context) =>
                    tokenAuths !=null
                        ? HomeView(
                            loginResponseModel:
                                LoginResponseModel(token: tokenAuths))
                        : LoginView(),
              ));
        
  }
}
