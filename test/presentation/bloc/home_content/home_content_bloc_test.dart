import 'package:bloc_test/bloc_test.dart';
import 'package:bmas/domain/entity/home_content_entity.dart';
import 'package:bmas/domain/usecase/get_home_content_usecase.dart';
import 'package:bmas/presentation/bloc/home_content/home_content_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetHomeContent extends Mock implements GetHomeContentUseCase {}

void main() {
  late MockGetHomeContent mockGetHomeContent;
  late HomeContentBloc sut;

  setUp(() {
    mockGetHomeContent = MockGetHomeContent();
    sut = HomeContentBloc(mockGetHomeContent);
  });

  tearDown(() {
    sut.close();
  });

  group('home content bloc test', () {
    const homeContent = HomeContentEntity(
        products: ContentEntity(
            section: 'products',
            sectionTitle: null,
            items: [ItemEntity(title: 'title', imageUrl: '', link: '')]),
        articles: ContentEntity(
            section: 'blogs',
            sectionTitle: 'blogs',
            items: [ItemEntity(title: 'title', imageUrl: '', link: '')]));

    test('make sure the initial state', () {
      expect(sut.state, HomeContentState.initial());
    });

    blocTest<HomeContentBloc, HomeContentState>(
      'test the bloc',
      build: () {
        when(() => mockGetHomeContent.execute())
            .thenAnswer((invocation) async => homeContent);
        return sut;
      },
      act: (bloc) {
        return bloc.add(GetHomeContentEvent());
      },
      expect: () => [
        const HomeContentState(status: GetHomeContentStatus.loading),
        const HomeContentState(
            status: GetHomeContentStatus.loaded,
            errorMessage: null,
            homeContent: homeContent)
      ],
    );
  });
}
