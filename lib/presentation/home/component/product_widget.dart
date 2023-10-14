import 'package:bmas/domain/entity/home_content_entity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, this.content});

  final ContentEntity? content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                blurRadius: 5.0,
                offset: const Offset(0, 2),
                color: Colors.grey.withOpacity(0.2))
          ]),
      child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 16.0,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: content?.items.map((e) {
                return InkWell(
                  onTap: () async {
                    final uri = Uri.parse(e.link);
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  },
                  child: Column(
                    children: [
                      Image.network(e.imageUrl),
                      Text(e.title),
                    ],
                  ),
                );
              }).toList() ??
              []),
    );
  }
}
