part of 'package_cubit.dart';

@immutable
abstract class PackageState {}

class PackageInitial extends PackageState {}
class GetPackagesLoad extends PackageState {}
class GetPackagesSuccess extends PackageState {}
class GetPackagesError extends PackageState {}