import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_hive_login/core/base/abstract_dio_service.dart';
import 'package:flutter_bloc_hive_login/core/init/cache/hive_cache.dart';
import 'package:flutter_bloc_hive_login/core/init/global/network_manager.dart';
import 'package:flutter_bloc_hive_login/core/service/dio_service.dart';
import 'package:flutter_bloc_hive_login/product/cubit/login_cubit.dart';
import 'package:flutter_bloc_hive_login/product/model/login_request_model.dart';
import 'package:flutter_bloc_hive_login/product/view/home_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(
              emailController,
              passwordController,
              formKey,
              dioService: DioService(NetworkManager.instance.dioInstance),
              hiveCache: HiveCache(),
            ),
        child: LoginDownView(
            emailController: emailController,
            passwordController: passwordController,
            formKey: formKey));
  }
}

class LoginDownView extends StatelessWidget {
  LoginDownView(
      {required this.emailController,
      required this.passwordController,
      required this.formKey,
      super.key});
  TextEditingController emailController;
  TextEditingController passwordController;
  GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      //!! dikkat et

      if (state is LoginCompeleted) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeView(loginResponseModel: state.loginResponseModel),
        ));
      }
    }, builder: (context, state) {
      return Scaffold(
        body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                autocorrect: true,
                autovalidateMode: validateMode(state),
              ),
              TextFormField(
                controller: passwordController,
                validator: validator,
                autocorrect: true,
                autovalidateMode: validateMode(state),
              ),
              buttons(context)
            ],
          ),
        ),
      );
    });
  }

  ElevatedButton buttons(BuildContext context) {
    return ElevatedButton(onPressed: () {
      context.read<LoginCubit>().loginRequest(LoginRequestModel(
          email: emailController.text.trim(),
          password: passwordController.text.trim()));
    }, child: BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginInitial) {
          return const Text("Login");
        } else if (state is LoginLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Text("Hata");
        }
      },
    ));
  }

  String? validator(String? value) =>
      (value!.length <= 3) ? " Please try again" : null;

  AutovalidateMode validateMode(LoginState state) =>
      (state is LoginValidateMode)
          ? (state.isFail ? AutovalidateMode.always : AutovalidateMode.disabled)
          : AutovalidateMode.disabled;
}
