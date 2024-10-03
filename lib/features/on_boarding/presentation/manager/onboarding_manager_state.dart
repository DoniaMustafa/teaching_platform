part of 'onboarding_manager_cubit.dart';

@immutable
sealed class OnboardingManagerState {}

final class OnboardingManagerInitial extends OnboardingManagerState {}
final class OnChangeOnBoardingState extends OnboardingManagerState {}
