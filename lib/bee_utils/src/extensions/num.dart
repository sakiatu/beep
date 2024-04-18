import 'dart:async';

extension NumExtension on num {
  bool get isEven => this % 2 == 0;

  bool get isOdd => this % 2 != 0;

  bool get isPositive => this > 0;

  bool get isNegative => this < 0;

  bool get isZero => this == 0;

  bool get isWhole => this % 1 == 0;

  bool get isFraction => this % 1 != 0;

  num get abs => this < 0 ? -this : this;

  num get ceil => ceilToDouble();

  num get floor => floorToDouble();

  num get round => roundToDouble();

  num get truncate => truncateToDouble();

  num get reciprocal => 1 / this;

  num get square => this * this;

  num get cube => this * this * this;
}

extension IntDurationExtension on int {
  Duration get milliseconds => Duration(milliseconds: this);

  Duration get seconds => Duration(seconds: this);

  Duration get minutes => Duration(minutes: this);

  Duration get hours => Duration(hours: this);

  Duration get days => Duration(days: this);
}

extension IntDelayExtension on int {
  Future delay([FutureOr Function()? callback]) async => Future.delayed(Duration(seconds: this), callback);
}
