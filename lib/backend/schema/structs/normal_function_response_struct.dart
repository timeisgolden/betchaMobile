// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NormalFunctionResponseStruct extends FFFirebaseStruct {
  NormalFunctionResponseStruct({
    bool? success,
    String? message,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _success = success,
        _message = message,
        super(firestoreUtilData);

  // "success" field.
  bool? _success;
  bool get success => _success ?? false;
  set success(bool? val) => _success = val;
  bool hasSuccess() => _success != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;
  bool hasMessage() => _message != null;

  static NormalFunctionResponseStruct fromMap(Map<String, dynamic> data) =>
      NormalFunctionResponseStruct(
        success: data['success'] as bool?,
        message: data['message'] as String?,
      );

  static NormalFunctionResponseStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? NormalFunctionResponseStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'success': _success,
        'message': _message,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'success': serializeParam(
          _success,
          ParamType.bool,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
      }.withoutNulls;

  static NormalFunctionResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NormalFunctionResponseStruct(
        success: deserializeParam(
          data['success'],
          ParamType.bool,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NormalFunctionResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NormalFunctionResponseStruct &&
        success == other.success &&
        message == other.message;
  }

  @override
  int get hashCode => const ListEquality().hash([success, message]);
}

NormalFunctionResponseStruct createNormalFunctionResponseStruct({
  bool? success,
  String? message,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NormalFunctionResponseStruct(
      success: success,
      message: message,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NormalFunctionResponseStruct? updateNormalFunctionResponseStruct(
  NormalFunctionResponseStruct? normalFunctionResponse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    normalFunctionResponse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNormalFunctionResponseStructData(
  Map<String, dynamic> firestoreData,
  NormalFunctionResponseStruct? normalFunctionResponse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (normalFunctionResponse == null) {
    return;
  }
  if (normalFunctionResponse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      normalFunctionResponse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final normalFunctionResponseData = getNormalFunctionResponseFirestoreData(
      normalFunctionResponse, forFieldValue);
  final nestedData =
      normalFunctionResponseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      normalFunctionResponse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNormalFunctionResponseFirestoreData(
  NormalFunctionResponseStruct? normalFunctionResponse, [
  bool forFieldValue = false,
]) {
  if (normalFunctionResponse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(normalFunctionResponse.toMap());

  // Add any Firestore field values
  normalFunctionResponse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNormalFunctionResponseListFirestoreData(
  List<NormalFunctionResponseStruct>? normalFunctionResponses,
) =>
    normalFunctionResponses
        ?.map((e) => getNormalFunctionResponseFirestoreData(e, true))
        .toList() ??
    [];
