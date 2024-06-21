import 'package:flutter/material.dart';
import 'package:movies_app/tvs/presentation/views/tv_view/tvs_view_body.dart';

class TvsView extends StatelessWidget {
  const TvsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TvsViewBody(),
    );
  }
}
