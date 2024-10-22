part of 'profile_details_cubit.dart';

@immutable
sealed class ProfileDetailsState {}

final class ProfileDetailsInitial extends ProfileDetailsState {}

final class ProfileDetailsLoading extends ProfileDetailsState {}

final class ProfileDetailsFailure extends ProfileDetailsState {
  final String error;
  ProfileDetailsFailure(this.error);
}

final class ProfileDetailsSuccess extends ProfileDetailsState {}

final class ProfileDetailsImageLoaded extends ProfileDetailsState {}
