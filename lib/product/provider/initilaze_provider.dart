import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../../core/init/cache/hive_cache.dart';

class InitilazeProvider extends ChangeNotifier {

  var box;
  InitilazeProvider(this.box) {
    checkToken();
  }

  String? checkToken() {
    String token = box.get(HivePath.tokenAuth.name);

    if (token.isEmpty || token == "") {
    } else if (token.isNotEmpty || token.length > 3) {
      return token;
    }
  }

  Future<String> getToken() async {
    var box = Hive.box(HivePath.token.name);

    return box.get(HivePath.tokenAuth.name);
  }

  bool? signOut() {
    var tokens = box.put(HivePath.tokenAuth.name, "");
    if (tokens == "") {
      true;
    } else {
      false;
    }
  }
}
