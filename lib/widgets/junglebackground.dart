import 'package:flutter/material.dart';

class JungleBackground extends StatelessWidget {
  final Widget child;

  const JungleBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/jungle.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}