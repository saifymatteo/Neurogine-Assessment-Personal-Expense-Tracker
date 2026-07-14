// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NeurogineExpenseModel {

 String get id; String get name;/// Amount in cents
 int get amount; DateTime get date;
/// Create a copy of NeurogineExpenseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NeurogineExpenseModelCopyWith<NeurogineExpenseModel> get copyWith => _$NeurogineExpenseModelCopyWithImpl<NeurogineExpenseModel>(this as NeurogineExpenseModel, _$identity);

  /// Serializes this NeurogineExpenseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NeurogineExpenseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,amount,date);

@override
String toString() {
  return 'NeurogineExpenseModel(id: $id, name: $name, amount: $amount, date: $date)';
}


}

/// @nodoc
abstract mixin class $NeurogineExpenseModelCopyWith<$Res>  {
  factory $NeurogineExpenseModelCopyWith(NeurogineExpenseModel value, $Res Function(NeurogineExpenseModel) _then) = _$NeurogineExpenseModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, int amount, DateTime date
});




}
/// @nodoc
class _$NeurogineExpenseModelCopyWithImpl<$Res>
    implements $NeurogineExpenseModelCopyWith<$Res> {
  _$NeurogineExpenseModelCopyWithImpl(this._self, this._then);

  final NeurogineExpenseModel _self;
  final $Res Function(NeurogineExpenseModel) _then;

/// Create a copy of NeurogineExpenseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? amount = null,Object? date = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [NeurogineExpenseModel].
extension NeurogineExpenseModelPatterns on NeurogineExpenseModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NeurogineExpenseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NeurogineExpenseModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NeurogineExpenseModel value)  $default,){
final _that = this;
switch (_that) {
case _NeurogineExpenseModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NeurogineExpenseModel value)?  $default,){
final _that = this;
switch (_that) {
case _NeurogineExpenseModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int amount,  DateTime date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NeurogineExpenseModel() when $default != null:
return $default(_that.id,_that.name,_that.amount,_that.date);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int amount,  DateTime date)  $default,) {final _that = this;
switch (_that) {
case _NeurogineExpenseModel():
return $default(_that.id,_that.name,_that.amount,_that.date);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int amount,  DateTime date)?  $default,) {final _that = this;
switch (_that) {
case _NeurogineExpenseModel() when $default != null:
return $default(_that.id,_that.name,_that.amount,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NeurogineExpenseModel extends NeurogineExpenseModel {
  const _NeurogineExpenseModel({required this.id, required this.name, required this.amount, required this.date}): super._();
  factory _NeurogineExpenseModel.fromJson(Map<String, dynamic> json) => _$NeurogineExpenseModelFromJson(json);

@override final  String id;
@override final  String name;
/// Amount in cents
@override final  int amount;
@override final  DateTime date;

/// Create a copy of NeurogineExpenseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NeurogineExpenseModelCopyWith<_NeurogineExpenseModel> get copyWith => __$NeurogineExpenseModelCopyWithImpl<_NeurogineExpenseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NeurogineExpenseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NeurogineExpenseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,amount,date);

@override
String toString() {
  return 'NeurogineExpenseModel(id: $id, name: $name, amount: $amount, date: $date)';
}


}

/// @nodoc
abstract mixin class _$NeurogineExpenseModelCopyWith<$Res> implements $NeurogineExpenseModelCopyWith<$Res> {
  factory _$NeurogineExpenseModelCopyWith(_NeurogineExpenseModel value, $Res Function(_NeurogineExpenseModel) _then) = __$NeurogineExpenseModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int amount, DateTime date
});




}
/// @nodoc
class __$NeurogineExpenseModelCopyWithImpl<$Res>
    implements _$NeurogineExpenseModelCopyWith<$Res> {
  __$NeurogineExpenseModelCopyWithImpl(this._self, this._then);

  final _NeurogineExpenseModel _self;
  final $Res Function(_NeurogineExpenseModel) _then;

/// Create a copy of NeurogineExpenseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? amount = null,Object? date = null,}) {
  return _then(_NeurogineExpenseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
