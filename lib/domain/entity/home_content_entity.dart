import 'package:equatable/equatable.dart';

class HomeContentEntity extends Equatable {
  final ContentEntity products;
  final ContentEntity articles;

  const HomeContentEntity({required this.products, required this.articles});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class ContentEntity extends Equatable {
  final String section;
  final String? sectionTitle;
  final List<ItemEntity> items;

  const ContentEntity(
      {required this.section, required this.sectionTitle, required this.items});

  @override
  List<Object?> get props => [section, sectionTitle, items];
}

class ItemEntity extends Equatable {
  final String title;
  final String imageUrl;
  final String link;

  const ItemEntity(
      {required this.title, required this.imageUrl, required this.link});

  @override
  List<Object?> get props => [title, imageUrl, link];
}
