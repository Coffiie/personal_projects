import '../entities/transaction.dart';

abstract class TransactionRepository {
  Future<List<Transaction>> getRecentTransactions();
  Future<double> getAvailableBalance();
  Future<double> getTransferLimit();
  Future<double> getSpentAmount();
}
