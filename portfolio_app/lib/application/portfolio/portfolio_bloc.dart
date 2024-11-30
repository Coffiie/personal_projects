import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/transaction.dart';
import '../../domain/repositories/transaction_repository.dart';

part 'portfolio_bloc.freezed.dart';
part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final TransactionRepository _repository;

  PortfolioBloc(this._repository) : super(const PortfolioState.initial()) {
    on<PortfolioEvent>((event, emit) async {
      await event.map(
        loadData: (e) async {
          emit(const PortfolioState.loading());
          try {
            final futures = await Future.wait([
              _repository.getRecentTransactions(),
              _repository.getAvailableBalance(),
              _repository.getTransferLimit(),
              _repository.getSpentAmount(),
            ]);

            emit(PortfolioState.loaded(
              transactions: futures[0] as List<Transaction>,
              balance: futures[1] as double,
              transferLimit: futures[2] as double,
              spentAmount: futures[3] as double,
            ));
          } catch (e) {
            emit(PortfolioState.error(e.toString()));
          }
        },
      );
    });
  }
}
