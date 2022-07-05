import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController controller;

  GlobalKey key = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void showOverlay(BuildContext context) async {
    final overLay = Overlay.of(context);
    final renderBox = key.currentContext?.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    OverlayEntry? entry = OverlayEntry(
        builder: (context) => Positioned(
            left: offset.dx,
            top: offset.dy + size.height + 8,
            width: size.width,
            child: buildOverLay()));
    overLay!.insert(entry);

    await Future.delayed(const Duration(seconds: 2));
    entry.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: SizedBox(
        width: Get.width,
        height: Get.height,
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            Container(height: 120, color: Colors.blue),
            Container(height: 120, color: Colors.red),
            Container(height: 120, color: Colors.green),
            Container(
              key: key,
              height: 120,
              color: Colors.yellowAccent,
              child: TextButton(
                onPressed: () {
                  WidgetsBinding.instance!
                      .addPostFrameCallback((_) => showOverlay(context));
                  showOverlay(context);
                },
                child: const Text("Click"),
              ),
            ),
            Container(height: 120, color: Colors.pink),
            Container(height: 120, color: Colors.grey),
            Container(height: 120, color: Colors.brown),
            Container(height: 120, color: Colors.black),
          ],
        ),
      )),
    );
  }

  Widget buildOverLay() => Material(
        color: Colors.transparent,
        elevation: 8,
        child: Column(
          children: [
            Container(height: 50, color: Colors.grey),
            Container(height: 50, color: Colors.brown),
            Container(height: 50, color: Colors.black),
          ],
        ),
      );
}
