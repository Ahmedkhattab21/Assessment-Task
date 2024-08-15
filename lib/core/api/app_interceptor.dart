import 'package:assesment_task/core/utils/constant_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:http_interceptor/http_interceptor.dart';

class AppInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    data.headers[ConstantKeys.contentType] = ConstantKeys.applicationJson;
    data.headers[ConstantKeys.acceptText] = ConstantKeys.applicationJson;
    data.headers[ConstantKeys.acceptLanguage] = "en";
    debugPrint(data.toString());
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    debugPrint(data.toString());
    return data;
  }
}
