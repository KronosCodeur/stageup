import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stage_up/res/assets_res.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset(
        AssetsRes.LOADING,
        width: size ?? 100,
        height: size ?? 100,
      ),
    );
  }
}
