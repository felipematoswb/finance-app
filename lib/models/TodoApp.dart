/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the TodoApp type in your schema. */
@immutable
class TodoApp extends Model {
  static const classType = const _TodoAppModelType();
  final String id;
  final String? _userId;
  final String? _assets;
  final bool? _buy;
  final double? _quantity;
  final double? _price;
  final TemporalDate? _date;
  final String? _notes;
  final double? _spend;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  TodoAppModelIdentifier get modelIdentifier {
    return TodoAppModelIdentifier(id: id);
  }

  String get userId {
    try {
      return _userId!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get assets {
    try {
      return _assets!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  bool? get buy {
    return _buy;
  }

  double get quantity {
    try {
      return _quantity!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  double get price {
    try {
      return _price!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  TemporalDate get date {
    try {
      return _date!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String? get notes {
    return _notes;
  }

  double get spend {
    try {
      return _spend!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  TemporalDateTime? get createdAt {
    return _createdAt;
  }

  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const TodoApp._internal(
      {required this.id,
      required userId,
      required assets,
      buy,
      required quantity,
      required price,
      required date,
      notes,
      required spend,
      createdAt,
      updatedAt})
      : _userId = userId,
        _assets = assets,
        _buy = buy,
        _quantity = quantity,
        _price = price,
        _date = date,
        _notes = notes,
        _spend = spend,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory TodoApp(
      {String? id,
      required String userId,
      required String assets,
      bool? buy,
      required double quantity,
      required double price,
      required TemporalDate date,
      String? notes,
      required double spend}) {
    return TodoApp._internal(
        id: id == null ? UUID.getUUID() : id,
        userId: userId,
        assets: assets,
        buy: buy,
        quantity: quantity,
        price: price,
        date: date,
        notes: notes,
        spend: spend);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TodoApp &&
        id == other.id &&
        _userId == other._userId &&
        _assets == other._assets &&
        _buy == other._buy &&
        _quantity == other._quantity &&
        _price == other._price &&
        _date == other._date &&
        _notes == other._notes &&
        _spend == other._spend;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("TodoApp {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("assets=" + "$_assets" + ", ");
    buffer.write("buy=" + (_buy != null ? _buy!.toString() : "null") + ", ");
    buffer.write("quantity=" +
        (_quantity != null ? _quantity!.toString() : "null") +
        ", ");
    buffer.write(
        "price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("date=" + (_date != null ? _date!.format() : "null") + ", ");
    buffer.write("notes=" + "$_notes" + ", ");
    buffer.write(
        "spend=" + (_spend != null ? _spend!.toString() : "null") + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  TodoApp copyWith(
      {String? userId,
      String? assets,
      bool? buy,
      double? quantity,
      double? price,
      TemporalDate? date,
      String? notes,
      double? spend}) {
    return TodoApp._internal(
        id: id,
        userId: userId ?? this.userId,
        assets: assets ?? this.assets,
        buy: buy ?? this.buy,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        date: date ?? this.date,
        notes: notes ?? this.notes,
        spend: spend ?? this.spend);
  }

  TodoApp.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _userId = json['userId'],
        _assets = json['assets'],
        _buy = json['buy'],
        _quantity = (json['quantity'] as num?)?.toDouble(),
        _price = (json['price'] as num?)?.toDouble(),
        _date =
            json['date'] != null ? TemporalDate.fromString(json['date']) : null,
        _notes = json['notes'],
        _spend = (json['spend'] as num?)?.toDouble(),
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': _userId,
        'assets': _assets,
        'buy': _buy,
        'quantity': _quantity,
        'price': _price,
        'date': _date?.format(),
        'notes': _notes,
        'spend': _spend,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'userId': _userId,
        'assets': _assets,
        'buy': _buy,
        'quantity': _quantity,
        'price': _price,
        'date': _date,
        'notes': _notes,
        'spend': _spend,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final QueryModelIdentifier<TodoAppModelIdentifier> MODEL_IDENTIFIER =
      QueryModelIdentifier<TodoAppModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField USERID = QueryField(fieldName: "userId");
  static final QueryField ASSETS = QueryField(fieldName: "assets");
  static final QueryField BUY = QueryField(fieldName: "buy");
  static final QueryField QUANTITY = QueryField(fieldName: "quantity");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField NOTES = QueryField(fieldName: "notes");
  static final QueryField SPEND = QueryField(fieldName: "spend");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TodoApp";
    modelSchemaDefinition.pluralName = "TodoApps";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: TodoApp.USERID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: TodoApp.ASSETS,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: TodoApp.BUY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: TodoApp.QUANTITY,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: TodoApp.PRICE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: TodoApp.DATE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: TodoApp.NOTES,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: TodoApp.SPEND,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'createdAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'updatedAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));
  });
}

class _TodoAppModelType extends ModelType<TodoApp> {
  const _TodoAppModelType();

  @override
  TodoApp fromJson(Map<String, dynamic> jsonData) {
    return TodoApp.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'TodoApp';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [TodoApp] in your schema.
 */
@immutable
class TodoAppModelIdentifier implements ModelIdentifier<TodoApp> {
  final String id;

  /** Create an instance of TodoAppModelIdentifier using [id] the primary key. */
  const TodoAppModelIdentifier({required this.id});

  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{'id': id});

  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
      .entries
      .map((entry) => (<String, dynamic>{entry.key: entry.value}))
      .toList();

  @override
  String serializeAsString() => serializeAsMap().values.join('#');

  @override
  String toString() => 'TodoAppModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is TodoAppModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
