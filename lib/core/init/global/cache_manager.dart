import 'package:flutter/material.dart';
import 'package:flutter_bloc_hive_login/core/init/cache/hive_cache.dart';
import 'package:hive_flutter/adapters.dart';
import "package:hive/hive.dart";
import 'package:hive_flutter/hive_flutter.dart';

class CacheManager {
  CacheManager._();

  Future<void> initHive() async {
    await Hive.initFlutter();
    await Hive.openBox(HivePath.token.name);
  }

  static final instance = CacheManager._();
}
