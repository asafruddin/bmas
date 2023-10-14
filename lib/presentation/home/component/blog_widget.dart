import 'package:bmas/domain/entity/home_content_entity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogWidget extends StatelessWidget {
  const BlogWidget({super.key, this.content});

  final ContentEntity? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            content?.sectionTitle ?? 'BLOG',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        ...content?.items.map((e) => ArticleCard(item: e)).toList() ??
            <Widget>[]
      ],
    );
  }
}

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.item,
  });

  final ItemEntity item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(item.link);
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 5.0,
                  offset: const Offset(0, 2),
                  color: Colors.grey.withOpacity(0.2))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8.0)),
                child: Image.network(item.imageUrl, fit: BoxFit.fitWidth)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Text(
                item.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.blue[800]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
