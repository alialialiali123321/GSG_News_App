import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../models/news_model.dart';

class NewsWidget extends StatelessWidget {
  final Articles articles;
  final Function function;
  const NewsWidget(this.articles, this.function, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: Row(children: [
        SizedBox(
          width: 100,
          height: 100,
          child: ConditionalBuilder(
            condition: articles.urlToImage != null,
            builder: (context) => CachedNetworkImage(
              imageUrl: articles.urlToImage!,
              placeholder: (context, url) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                );
              },
              errorWidget: (context, url, error) => const Center(
                child: Text(
                  'Error',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              fit: BoxFit.cover,
            ),
            fallback: (context) => const Center(
              child: Text(
                'Null',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              articles.title ?? 'Not define',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              articles.description ?? 'Not define',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                const Text('Author :'),
                Expanded(
                  child: Text(articles.author ?? 'Not define', maxLines: 1),
                ),
                IconButton(
                  onPressed: () {
                    function(articles);
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: articles.isLike ? Colors.red : Colors.grey,
                  ),
                )
              ],
            )
          ],
        ))
      ]),
    );
  }
}
