part of 'home_content_bloc.dart';

enum GetHomeContentStatus { init, loading, loaded, error }

class HomeContentState extends Equatable {
  const HomeContentState({
    this.homeContent,
    required this.status,
    this.errorMessage,
  });

  final HomeContentEntity? homeContent;
  final GetHomeContentStatus status;
  final String? errorMessage;

  @override
  List<Object?> get props => [homeContent, status, errorMessage];

  factory HomeContentState.initial() =>
      const HomeContentState(status: GetHomeContentStatus.init);

  HomeContentState copyWith(
      {HomeContentEntity? homeContent,
      GetHomeContentStatus? status,
      String? errorMessage}) {
    return HomeContentState(
        homeContent: homeContent,
        status: status ?? this.status,
        errorMessage: errorMessage);
  }
}
