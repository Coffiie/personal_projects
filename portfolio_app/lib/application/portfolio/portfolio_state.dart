part of 'portfolio_bloc.dart';

@freezed
class PortfolioState with _$PortfolioState {
  const factory PortfolioState.initial() = _Initial;
  const factory PortfolioState.loading() = _Loading;
  const factory PortfolioState.loaded({
    required List<Transaction> transactions,
    required double balance,
    required double transferLimit,
    required double spentAmount,
  }) = _Loaded;
  const factory PortfolioState.error(String message) = _Error;
}
