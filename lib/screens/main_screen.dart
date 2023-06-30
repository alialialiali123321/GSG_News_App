import 'package:flutter/material.dart';

import '../data/fake_news_response.dart';
import '../models/news_model.dart';
import 'all_news_screen.dart';
import 'favorite_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  likeNews(Articles articles) {
    int index = newsModel.articles!.indexOf(articles);
    newsModel.articles![index].isLike = !newsModel.articles![index].isLike;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News App'),
          bottom: const TabBar(tabs: [
            Tab(
              text: 'All ',
            ),
            Tab(
              text: 'Favorite ',
            )
          ]),
        ),
        body: TabBarView(
          children: [
            AllNewsScreen(likeNews),
            FavoriteScreen(likeNews),
          ],
        ),
      ),
    );
  }
}
