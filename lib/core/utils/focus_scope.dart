import 'package:flutter/widgets.dart';

extension FocusScopeEnhancement on FocusScope {
  bool get hasPrimaryFocus {
    return primaryFocus != null;
  }
}

extension FocusScopeAndBuildContextEnhancement on BuildContext {
  void unfocus({UnfocusDisposition disposition = UnfocusDisposition.scope}) {
    FocusScope.of(this).unfocus(disposition: disposition);
  }
}
