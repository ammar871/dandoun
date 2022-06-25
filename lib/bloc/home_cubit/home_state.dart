part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}


class GetHomeDataLoad extends HomeState {}
class GetHomeDataSuccess extends HomeState {}
class GetHomeDataError extends HomeState {}




//fav

class GetFavGetDataLoad extends HomeState {}
class GetFavLoadDataSuccess extends HomeState {

  final List<ResponseFavorite> responseFav;

  GetFavLoadDataSuccess(this.responseFav);
}
class GetFavLoadDataError extends HomeState {}





class ChangeFavSuccess extends HomeState {}

class AddFavSuccessLoad extends HomeState {}
class ChangeFavSuccessError extends HomeState {}



class DownloadFileLoad extends HomeState {}
class DownloadFileLoadProgress extends HomeState {


 DownloadFileLoadProgress(
      );
}
class DownloadFileSuccess extends HomeState {}
class DownloadFileError extends HomeState{}