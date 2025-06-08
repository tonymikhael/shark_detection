sealed class AppState {}

final class AppInitial extends AppState {}

final class SetSharkDetectedState extends AppState {}

final class ReSetSharkDetectedState extends AppState {}

final class LoadingState extends AppState {}

final class SetFlagState extends AppState {}

final class ResetFlagState extends AppState {}

final class ChangeAppThemeState extends AppState {}

// Add language state
class ChangeLanguageState extends AppState {}
