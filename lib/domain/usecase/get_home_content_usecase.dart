import 'package:bmas/domain/entity/home_content_entity.dart';
import 'package:bmas/domain/repository/repository.dart';

class GetHomeContentUseCase {
  final Repository repository;

  GetHomeContentUseCase({required this.repository});

  Future<HomeContentEntity> execute() {
    return repository.getHomeContent();
  }
}
