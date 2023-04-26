import 'package:flutter/material.dart';

export 'platform_widget.dart';

class PlatformWidget extends StatelessWidget {
  const PlatformWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      width: 200,
      child: HtmlElementView(
        viewType: 'web-label',
      ),
    );
  }
}
