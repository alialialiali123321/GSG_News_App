import 'package:flutter/material.dart';

import '../components/news_widget.dart';
import '../data/fake_news_response.dart';

class AllNewsScreen extends StatelessWidget {
  final Function function;
  const AllNewsScreen(this.function, {super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsModel.articles!.length,
      itemBuilder: (context, index) {
        return NewsWidget(newsModel.articles![index], function);
      },
    );
    //  ListView( children: newsModel.articles!.map((e) => NewsWidget(e, function)).toList());
  }
}
