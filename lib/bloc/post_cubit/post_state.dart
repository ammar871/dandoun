part of 'post_cubit.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}
class GetPostsLoad extends PostState {}
class GetPostsSuccess extends PostState {}
class GetPostsError extends PostState {}

class GetPostDetailsLoad extends PostState {}
class GetPostDetailsSuccess extends PostState {}
class GetPostDetailsError extends PostState {}


class ListenPlayerState extends PostState {}


class AudioPlayerPlayedSuccess extends PostState {}
class AudioPlayerPlayedError extends PostState {}


class AudioPlayerPauseSuccess extends PostState {}
class AudioPlayerPauseError extends PostState {}


class AudioPlayerStopSuccess extends PostState {}
class AudioPlayerStopError extends PostState {}





class SearchProductDataLoad extends PostState {}
class SearchProductDataSuccess extends PostState {}
class SearchProductDataError extends PostState {}