import 'package:flutter/cupertino.dart';

class MyGlobalKey {
  final GlobalKey<State<StatefulWidget>> key = GlobalKey();

  MyGlobalKey(GlobalKey<State<StatefulWidget>> globalKey);

}
