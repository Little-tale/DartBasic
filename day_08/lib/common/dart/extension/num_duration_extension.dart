/// Adds extensions to num (ie. int & double) to make creating durations simple:
///
/// ```
/// 200.ms // equivalent to Duration(milliseconds: 200)
/// 3.seconds // equivalent to Duration(milliseconds: 3000)
/// 1.5.days // equivalent to Duration(hours: 36)
/// ```
extension NumDurationExtension on num {
  Duration get n_microseconds => Duration(microseconds: round());

  Duration get n_ms => (this * 1000).n_microseconds;

  Duration get n_milliseconds => (this * 1000).n_microseconds;

  Duration get n_seconds => (this * 1000 * 1000).n_microseconds;

  Duration get n_minutes => (this * 1000 * 1000 * 60).n_microseconds;

  Duration get n_hours => (this * 1000 * 1000 * 60 * 60).n_microseconds;

  Duration get n_days => (this * 1000 * 1000 * 60 * 60 * 24).n_microseconds;
}
