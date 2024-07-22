import 'package:flutter/widgets.dart';

extension SizeExtensions on num {
  double h(BuildContext context) {
    return MediaQuery.of(context).size.height * this;
  }

  double w(BuildContext context) {
    return MediaQuery.of(context).size.width * this;
  }
}
