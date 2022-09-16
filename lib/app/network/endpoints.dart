import '../utils/AppConstants.dart';

enum EndPoint { getDetails }

extension URLExtension on EndPoint {
  String get url {
    switch (this) {
      case EndPoint.getDetails:
        return "${baseUrl}5d565297300000680030a986";

      default:
        throw Exception(["Endpoint not defined"]);
    }
  }
}

extension RequestMode on EndPoint {
  RequestType get requestType {
    RequestType requestType = RequestType.get;

    switch (this) {
      case EndPoint.getDetails:
        requestType = RequestType.get;
        break;

        //GET API'S

        // case EndPoint.countryList:

        requestType = RequestType.get;
        break;

        //PUT API'S

        requestType = RequestType.put;
        break;

        break;

        // TODO: Handle this case.
        break;

        //delete api

        requestType = RequestType.delete;

        break;
    }
    return requestType;
  }
}

extension Token on EndPoint {
  bool get shouldAddToken {
    var shouldAdd = true;

    switch (this) {
      case EndPoint.getDetails:
        shouldAdd = false;
        break;

      default:
        break;
    }

    return shouldAdd;
  }
}
