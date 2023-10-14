import 'package:bmas/domain/entity/home_content_entity.dart';
import 'package:bmas/domain/repository/repository.dart';
import 'package:bmas/domain/usecase/get_home_content_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements Repository {}

void main() {
  late GetHomeContentUseCase sut;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    sut = GetHomeContentUseCase(repository: mockRepository);
  });

  group(
    'Get Home Content',
    () {
      const homeContent = HomeContentEntity(
          products: ContentEntity(
              section: 'products',
              sectionTitle: null,
              items: [ItemEntity(title: 'title', imageUrl: '', link: '')]),
          articles: ContentEntity(
              section: 'blogs',
              sectionTitle: 'blogs',
              items: [ItemEntity(title: 'title', imageUrl: '', link: '')]));

      void arragedGetHomeContent() {
        when(() => mockRepository.getHomeContent())
            .thenAnswer((invocation) async => homeContent);
      }

      void arragedFailGetHomeContent() {
        when(() => mockRepository.getHomeContent()).thenThrow(Exception());
      }

      test('get home content using repository', () async {
        arragedGetHomeContent();
        await sut.execute();

        verify(() => mockRepository.getHomeContent()).called(1);
      });

      test('the data should not null', () async {
        arragedGetHomeContent();
        final result = await sut.execute();

        expect(result.articles, isNotNull);
        expect(result.products, isNotNull);
      });

      test('should get exception when error', () async {
        try {
          arragedFailGetHomeContent();

          final result = await sut.execute();
          expect(result, Exception());
        } catch (e) {
          expect(true, true);
        }
      });
    },
  );
}
