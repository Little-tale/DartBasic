import 'package:easy_localization/easy_localization.dart';

extension DateTimeExtension on DateTime {
  String get formattedDate => DateFormat('dd/MM/yyyy').format(this);

  String get formattedTime => DateFormat('HH:mm').format(this);

  String get formattedDateTime => DateFormat('dd/MM/yyyy HH:mm').format(this);

  String get relativeDays {
    final diffDays = difference(DateTime.now().onlyDate).inDays;
    final isNegative = diffDays.isNegative;

    final checkCondition = (diffDays, isNegative);

    return switch (checkCondition) {
      (0, _) => _tillToday,
      (1, false) => _tillTomorrow,
      (_, true) => _dayPassed,
      _ => _dayLeft
    };
  }

  DateTime get onlyDate {
    return DateTime(year, month, day);
  }

  /// 오늘까지
  String get _tillToday => 'tillToday'.tr();

  /// 내일까지
  String get _tillTomorrow => 'tillTomorrow'.tr();

  /// ~~일 지남 (과거 날짜)
  String get _dayPassed {
    // today - this (과거일수록 양수)
    final days = DateTime.now().onlyDate.difference(onlyDate).inDays;
    return 'dayPassed'.tr(
      namedArgs: {
        'daysCount': '$days',
      },
    );
  }

  /// ~~일 남음 (미래 날짜)
  String get _dayLeft {
    // this - today (미래일수록 양수)
    final days = onlyDate.difference(DateTime.now().onlyDate).inDays;
    return 'dayLeft'.tr(
      namedArgs: {
        'daysCount': '$days',
      },
    );
  }
}
