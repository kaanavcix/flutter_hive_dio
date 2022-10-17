import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_hive_login/core/init/cache/hive_cache.dart';
import 'package:flutter_bloc_hive_login/core/init/global/cache_manager.dart';
import 'package:flutter_bloc_hive_login/product/provider/initilaze_provider.dart';
import 'package:flutter_bloc_hive_login/product/view/onboarding_view.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox(HivePath.token.name);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => InitilazeProvider(box),
      builder: (context, child) => const OnboardingView(),
    )
  ]));
}
