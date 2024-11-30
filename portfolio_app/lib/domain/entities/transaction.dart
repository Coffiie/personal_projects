class Transaction {
  final String id;
  final String title;
  final String subtitle;
  final double amount;
  final String logoPath;
  final DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.logoPath,
    required this.date,
  });
}
