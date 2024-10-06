part of 'main_cubit.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}

final class ProfilePage extends MainState {}

final class SavedPage extends MainState {}

final class HomePage extends MainState {}

final class TicketsPage extends MainState {}

final class ExplorePage extends MainState {}
