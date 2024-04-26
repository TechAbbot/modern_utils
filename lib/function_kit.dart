import 'dart:io';

Future<bool> hasNetwork() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
  return false;
}

List<List<T>> splitList<T>({required List<T> list, required int limitBatch}) {
  List<List<T>> splitList = [];
  if (list.length > limitBatch) {
    for (var i = 0; i < list.length; i += limitBatch) {
      if (i + limitBatch > list.length) {
        int subIndex = list.length - i;
        splitList.add(list.sublist(i, i + subIndex));
      } else {
        splitList.add(list.sublist(i, i + limitBatch));
      }
    }
  } else {
    splitList.add(list);
  }
  return splitList;
}

List<String> convertStringToListString(String inputString) =>
    inputString.substring(1, inputString.length - 1).split(',').toList();

String secondsToTime(int seconds) {
  if (seconds == 0) {
    return "0s";
  }
  final days = seconds ~/ (24 * 3600);
  seconds %= (24 * 3600);
  final hours = seconds ~/ 3600;
  seconds %= 3600;
  final minutes = seconds ~/ 60;
  seconds %= 60;

  final List<String> parts = [];
  if (days > 0) parts.add('${days}d');
  if (hours > 0) parts.add('${hours}h');
  if (minutes > 0) parts.add('${minutes}m');
  if (seconds > 0) parts.add('${seconds}s');

  return parts.join(' ');
}

String metersToKilometers(double meters, {int decimals = 2}) {
  return "${(meters / 1000).toStringAsFixed(decimals)} km";
}
