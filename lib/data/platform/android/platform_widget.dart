import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class PlatformWidget extends StatelessWidget {
  const PlatformWidget({super.key});

  @override
  Widget build(BuildContext context) {
    late final Widget view;
    if (defaultTargetPlatform == TargetPlatform.android) {
      const String viewType = 'INTEGRATION_ANDROID';
      final Map<String, dynamic> creationParams = {};

      view = PlatformViewLink(
        surfaceFactory: ((context, controller) {
          return AndroidViewSurface(
            controller: controller as AndroidViewController,
            hitTestBehavior: PlatformViewHitTestBehavior.translucent,
            gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
          );
        }),
        onCreatePlatformView: ((params) {
          return PlatformViewsService.initSurfaceAndroidView(
            id: params.id,
            viewType: viewType,
            layoutDirection: TextDirection.ltr,
            creationParams: creationParams,
            creationParamsCodec: const StandardMessageCodec(),
            onFocus: () {
              params.onFocusChanged(true);
            },
          )
            ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
            ..create();
        }),
        viewType: viewType,
      );
    } else {
      view = Text('$defaultTargetPlatform is not supported');
    }

    return SizedBox(
      height: 50,
      width: 200,
      child: view,
    );
  }
}
