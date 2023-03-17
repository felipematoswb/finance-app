class StockPrice {
  final DateTime timestamp;
  final double open;
  final double high;
  final double low;
  final double close;
  final int volume;

  StockPrice(
    this.timestamp,
    this.open,
    this.high,
    this.low,
    this.close,
    this.volume,
  );
}
