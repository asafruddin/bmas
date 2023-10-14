import 'package:bmas/domain/entity/home_content_entity.dart';

class SectionModel {
  final String? section;
  final String? sectionTitle;
  final List<ItemModel>? items;

  SectionModel(
      {required this.section, required this.sectionTitle, required this.items});

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      section: json['section'],
      sectionTitle: json['section_title'],
      items: json['items'] == null
          ? null
          : (json['items'] as List)
              .map((e) => ItemModel.fromJson(e, json['section']))
              .toList(),
    );
  }

  ContentEntity toDomain() {
    return ContentEntity(
        section: section ?? '',
        sectionTitle: sectionTitle,
        items: items?.map((e) => e.toDomain()).toList() ?? []);
  }
}

class ItemModel {
  final String? name;
  final String? imageUrl;
  final String? link;

  ItemModel({required this.name, required this.imageUrl, required this.link});

  factory ItemModel.fromJson(Map<String, dynamic> json, String section) {
    if (section == 'articles') {
      return ItemModel(
          name: json['article_title'],
          imageUrl: json['article_image'],
          link: json['link']);
    }
    return ItemModel(
        name: json['product_name'],
        imageUrl: json['product_image'],
        link: json['link']);
  }

  ItemEntity toDomain() {
    return ItemEntity(
        title: name ?? '', imageUrl: imageUrl ?? '', link: link ?? '');
  }
}
