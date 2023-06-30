import 'package:flutter/material.dart';

import '../components/news_widget.dart';
import '../data/fake_news_response.dart';

class FavoriteScreen extends StatelessWidget {
  final Function function;
  const FavoriteScreen(this.function, {super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsModel.articles!.where((element) => element.isLike).length,
      itemBuilder: (context, index) {
        return NewsWidget(
          newsModel.articles!
              .where((element) => element.isLike)
              .toList()[index],
          function,
        );
      },
    );
  }
}
