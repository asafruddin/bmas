import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bmas/domain/entity/home_content_entity.dart';
import 'package:bmas/domain/usecase/get_home_content_usecase.dart';
import 'package:equatable/equatable.dart';

part 'home_content_event.dart';
part 'home_content_state.dart';

class HomeContentBloc extends Bloc<HomeContentEvent, HomeContentState> {
  final GetHomeContentUseCase getContentUseCase;

  HomeContentBloc(this.getContentUseCase) : super(HomeContentState.initial()) {
    on<GetHomeContentEvent>(getHomeContent);
  }

  Future<void> getHomeContent(
      GetHomeContentEvent event, Emitter<HomeContentState> emit) async {
    emit(state.copyWith(status: GetHomeContentStatus.loading));

    try {
      final result = await getContentUseCase.execute();
      emit(state.copyWith(
          status: GetHomeContentStatus.loaded, homeContent: result));
    } catch (e, s) {
      log('---> ERROR $s');

      emit(state.copyWith(
          status: GetHomeContentStatus.error, errorMessage: e.toString()));
    }
  }
}
