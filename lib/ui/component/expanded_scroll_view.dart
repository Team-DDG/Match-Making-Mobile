import 'package:flutter/material.dart';

class ExpandedScrollView extends StatelessWidget {
  final Widget child;

  const ExpandedScrollView({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(child: child),
        ),
      );
    });
  }
}
