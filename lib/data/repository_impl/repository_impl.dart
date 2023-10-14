import 'package:bmas/data/datasource/remote.dart';
import 'package:bmas/domain/entity/home_content_entity.dart';
import 'package:bmas/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remote;

  RepositoryImpl({required this.remote});

  @override
  Future<HomeContentEntity> getHomeContent() async {
    final result = await remote.getHomeContent();

    final idxArticles =
        result.indexWhere((element) => element.section == 'articles');
    final idxProducts =
        result.indexWhere((element) => element.section == 'products');

    final content = HomeContentEntity(
        products: result[idxProducts].toDomain(),
        articles: result[idxArticles].toDomain());
    return content;
  }
}
