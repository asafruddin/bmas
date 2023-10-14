import 'package:bmas/core/network_client.dart';
import 'package:bmas/data/datasource/remote.dart';
import 'package:bmas/data/repository_impl/repository_impl.dart';
import 'package:bmas/domain/repository/repository.dart';
import 'package:bmas/domain/usecase/get_home_content_usecase.dart';
import 'package:bmas/presentation/bloc/home_content/home_content_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => NetworkClient());

  /// register network client (DIO)
  sl.registerLazySingleton(() => sl<NetworkClient>().dio);

  /// register remote datasource
  sl.registerFactory(() => RemoteDataSource(dio: sl()));

  /// register repository
  sl.registerFactory<Repository>(() => RepositoryImpl(remote: sl()));

  /// register usecase
  sl.registerFactory(() => GetHomeContentUseCase(repository: sl()));

  /// register state management (BLOC)
  sl.registerFactory(() => HomeContentBloc(sl()));
}
