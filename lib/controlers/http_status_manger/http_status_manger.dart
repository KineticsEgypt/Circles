import 'package:meta/meta.dart';

class HttpStatusManger{
  static String getStatusMessage({
    @required int status,
    String messageFor400,
    String messageFor200,
  }){
    if(status == null)
      // no status code - code error no need for subtitle
      return "careful null status";
    if(status == -1)
      // client's request in process
      return "Currently service not available";
    if(status == -2){
      // client's request in process
      return "Wait until your request complete";
    }else if(status >= 200 && status < 300){
      // client's request was successfully received
      return messageFor200 ?? "Request complete successfully";
    } else if(status >= 400 && status < 500){
      // client's request have error
      switch(status){
        case 400:
          return messageFor400 ?? "Failed to complete request";
        default:
          return "Failed to complete request";
      }
    } else if(status >= 500){
      // server error
      return "Currently service not available";
    } else {
      // no error match so return default error
      return "Exception, failed to complete request";
    }

  }
}