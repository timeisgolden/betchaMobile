import '/backend/schema/structs/index.dart';

class DeleteFriendshipCloudFunctionCallResponse {
  DeleteFriendshipCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
    this.resultAsString,
    this.data,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
  String? resultAsString;
  NormalFunctionResponseStruct? data;
}

class AddFriendRequestCloudFunctionCallResponse {
  AddFriendRequestCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
    this.resultAsString,
    this.data,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
  String? resultAsString;
  NormalFunctionResponseStruct? data;
}
