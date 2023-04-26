import 'package:flutter/material.dart';
import 'package:integrations_flutter/data/service.dart';

import '../../data/platform/platform_widget.dart'
    if (dart.library.html) '../../data/platform/web/platform_widget.dart'
    if (dart.library.io) '../../data/platform/android/platform_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _service = getService();
  final TextEditingController _editingController = TextEditingController();

  void _setValue() async {
    await _service.callMethodChannel(_editingController.value.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Center(child: PlatformWidget()),
            const SizedBox(height: 5),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _editingController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter text here',
                  filled: true,
                  fillColor: Colors.green[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _setValue,
        heroTag: null,
        child: const Icon(Icons.upload),
      ),
    );
  }
}
