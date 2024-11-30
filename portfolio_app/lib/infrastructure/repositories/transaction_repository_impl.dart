import '../../domain/entities/transaction.dart';
import '../../domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<List<Transaction>> getRecentTransactions() async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      Transaction(
        id: '1',
        title: 'AT&T',
        subtitle: 'Unlimited Family Plan',
        amount: -34.99,
        logoPath: 'assets/att_logo.png',
        date: DateTime.now(),
      ),
      Transaction(
        id: '2',
        title: 'CC Subscription',
        subtitle: 'CC All Apps',
        amount: -59.99,
        logoPath: 'assets/adobe_logo.png',
        date: DateTime.now(),
      ),
    ];
  }

  @override
  Future<double> getAvailableBalance() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return 13528.31;
  }

  @override
  Future<double> getTransferLimit() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return 12000.0;
  }

  @override
  Future<double> getSpentAmount() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return 1244.65;
  }
}
