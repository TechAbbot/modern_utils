import 'dart:io';

/// To check wheather internet is connected or not.
///
/// It simply lookup using `InternetAddress.lookup` with https://www.google.com.
/// If it returns any `rawAddress` then return `true` else for any condition `false`.
///
/// To customise lookup as per your region you can use `lookupUrl`.
///
Future<bool> hasNetwork([String? lookupUrl]) async {
  try {
    final result =
        await InternetAddress.lookup(lookupUrl ?? 'https://www.google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  } catch (_) {
    return false;
  }
  return false;
}

/// To split one list into multiple list with `splitList<T>` where T is any datatype.
///
/// i.e. `[1, 2, 3, 4, 5, 6]` and now split this list with 2 `collection`.
/// Now result should be `[[1, 2], [3, 4], [5, 6]]`.
///
/// i.e. `[1, 2, 3, 4, 5, 6, 7]` and now split this list with 3 `collection`.
/// Now result should be `[[1, 2, 3], [3, 4, 6], [7]]`.
///
List<List<T>> splitList<T>({required List<T> list, required int collection}) {
  List<List<T>> splitList = [];
  if (list.length > collection) {
    for (var i = 0; i < list.length; i += collection) {
      if (i + collection > list.length) {
        int subIndex = list.length - i;
        splitList.add(list.sublist(i, i + subIndex));
      } else {
        splitList.add(list.sublist(i, i + collection));
      }
    }
  } else {
    splitList.add(list);
  }
  return splitList;
}

/// To convert String to List<String>. String can be start and end with `[]` or simple `,` separated String.
///
/// i.e. `"[1, 2, 3, 4, 5, 6]"` will be converted into `[1, 2, 3, 4, 5, 6]`.
///
/// i.e. `"1,2,3,4,5,6,7"` will be converted into `[1, 2, 3, 4, 5, 6, 7]`.
///
List<String> convertStringToListString(String inputString) {
  if (inputString[0] == '[' && inputString[inputString.length - 1] == ']') {
    return inputString.substring(1, inputString.length - 1).split(',').toList();
  } else {
    return inputString.split(',').toList();
  }
}

/// To convert seconds into formatted time.
///
/// i.e `8320` to `2h 18m 40s`.
///
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

/// To convert meters to kilometers.
///
/// i.e. `8320` to `8.32 km`.
///
String metersToKilometers(double meters, {int decimals = 2}) {
  return "${(meters / 1000).toStringAsFixed(decimals)} km";
}
