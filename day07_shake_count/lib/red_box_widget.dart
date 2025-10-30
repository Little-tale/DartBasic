import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class RedBoxWidget extends StatelessWidget {
  const RedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      Container().box.red900.size(40, 40).make();
}
