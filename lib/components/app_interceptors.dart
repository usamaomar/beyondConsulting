import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../app_state.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/schema/structs/token_model_struct.dart';

class AppInterceptors extends Interceptor {
  @override
  Future<dynamic> onRequest(options, handler) async {
    if (options.headers['Authorization'] != null) {
      if (options.headers['Authorization']
          .toString()
          .replaceAll('Bearer ', '')
          .replaceAll('null', '')
          .isNotEmpty) {
        var header = options.headers['Authorization'];
        bool isExpired = JwtDecoder.isExpired(header);
        if (isExpired) {
          var userModel = FFAppState().tokenModelAppState;
          await RefreshTokenCall.call(
                  token: userModel.token, refreshToken: userModel.refreshToken)
              .then((value) {
            TokenModelStruct? tokenModelStruct =
                TokenModelStruct.maybeFromMap(LoginApiCall.tokenJsonModel(
              (value.jsonBody ?? ''),
            ));
            FFAppState().tokenModelAppState = tokenModelStruct!;
            options.headers['Authorization'] =
                'Bearer ${FFAppState().tokenModelAppState.token}';
            return handler.next(options);
          });
        } else {
          return handler.next(options);
        }
      } else {
        return handler.next(options);
      }
    } else {
      return handler.next(options);
    }
  }

  @override
  FutureOr<dynamic> onError(response, handler) async {
    return handler.next(response);
  }

  @override
  FutureOr<dynamic> onResponse(response, handler) async {
    return handler.next(response);
  }
}
