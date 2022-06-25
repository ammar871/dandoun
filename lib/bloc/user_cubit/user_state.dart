part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}
//image
class UploadImageLoad extends UserState{


}
class UploadImageSuccess extends UserState{
  final String imageUpload;

  UploadImageSuccess(this.imageUpload);
}

class PickedImage extends UserState{
  final File imagePath;

  PickedImage(this.imagePath);
}


class GetUserDetails extends UserState{}

//update User
class UpdateProfileLoad extends UserState{


}
class UpdateProfileSuccess extends UserState{
  final String meassge;

  UpdateProfileSuccess(this.meassge);
}
class UpdateProfileError extends UserState{
  final String meassge;

  UpdateProfileError(this.meassge);

}