// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blank_screen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BlankScreen _$BlankScreenFromJson(Map<String, dynamic> json) {
  return _BlankScreen.fromJson(json);
}

/// @nodoc
mixin _$BlankScreen {
// 6. list all the arguments/properties
  Color? get color => throw _privateConstructorUsedError;

  /// Serializes this BlankScreen to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BlankScreen
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlankScreenCopyWith<BlankScreen> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlankScreenCopyWith<$Res> {
  factory $BlankScreenCopyWith(
          BlankScreen value, $Res Function(BlankScreen) then) =
      _$BlankScreenCopyWithImpl<$Res, BlankScreen>;
  @useResult
  $Res call({Color? color});
}

/// @nodoc
class _$BlankScreenCopyWithImpl<$Res, $Val extends BlankScreen>
    implements $BlankScreenCopyWith<$Res> {
  _$BlankScreenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlankScreen
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlankScreenImplCopyWith<$Res>
    implements $BlankScreenCopyWith<$Res> {
  factory _$$BlankScreenImplCopyWith(
          _$BlankScreenImpl value, $Res Function(_$BlankScreenImpl) then) =
      __$$BlankScreenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Color? color});
}

/// @nodoc
class __$$BlankScreenImplCopyWithImpl<$Res>
    extends _$BlankScreenCopyWithImpl<$Res, _$BlankScreenImpl>
    implements _$$BlankScreenImplCopyWith<$Res> {
  __$$BlankScreenImplCopyWithImpl(
      _$BlankScreenImpl _value, $Res Function(_$BlankScreenImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlankScreen
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = freezed,
  }) {
    return _then(_$BlankScreenImpl(
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlankScreenImpl extends _BlankScreen {
  _$BlankScreenImpl({this.color}) : super._();

  factory _$BlankScreenImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlankScreenImplFromJson(json);

// 6. list all the arguments/properties
  @override
  final Color? color;

  @override
  String toString() {
    return 'BlankScreen(color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlankScreenImpl &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, color);

  /// Create a copy of BlankScreen
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlankScreenImplCopyWith<_$BlankScreenImpl> get copyWith =>
      __$$BlankScreenImplCopyWithImpl<_$BlankScreenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlankScreenImplToJson(
      this,
    );
  }
}

abstract class _BlankScreen extends BlankScreen implements GYWDrawing {
  factory _BlankScreen({final Color? color}) = _$BlankScreenImpl;
  _BlankScreen._() : super._();

  factory _BlankScreen.fromJson(Map<String, dynamic> json) =
      _$BlankScreenImpl.fromJson;

// 6. list all the arguments/properties
  @override
  Color? get color;

  /// Create a copy of BlankScreen
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlankScreenImplCopyWith<_$BlankScreenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
