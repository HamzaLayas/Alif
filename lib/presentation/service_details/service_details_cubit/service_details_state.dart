part of 'service_details_cubit.dart';

sealed class ServiceDetailsState extends Equatable {
  const ServiceDetailsState();

  @override
  List<Object> get props => [];
}

final class ServiceDetailsInitial extends ServiceDetailsState {}
