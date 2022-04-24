import 'package:flutter/material.dart';
import 'package:meditation_app/utils/theme.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    Key? key,
    required this.portrait,
    required this.landscape,
  }) : super(key: key);

  final Widget portrait;
  final Widget landscape;

  @override
  Widget build(BuildContext context) {
    return context.orientation == Orientation.portrait ? portrait : landscape;
  }
}
