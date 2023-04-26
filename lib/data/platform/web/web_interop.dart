@JS('ClicksNamespace')
library interop;

import 'dart:html';
import 'dart:ui' as ui;
import 'package:js/js.dart';

@JS('JsInteropManager')
class _JsInteropManager {
  external dynamic get labelElement;

  external setValueToJs(String value);
}

class InteropManager {
  final _interop = _JsInteropManager();

  final document = DivElement()
    ..innerHtml = 'Enter text'
    ..style.width = '100%'
    ..style.height = '100%';

  InteropManager() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('web-label', (viewId) {
      return document;
    });
  }
  setValueToJs(String text) {
    _interop.setValueToJs(text);
    document.setInnerHtml(_interop.labelElement.innerText);
  }
}
