import 'package:bmas/domain/entity/home_content_entity.dart';

abstract class Repository {
  Future<HomeContentEntity> getHomeContent();
}
