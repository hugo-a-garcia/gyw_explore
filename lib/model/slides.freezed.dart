// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slides.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Slides _$SlidesFromJson(Map<String, dynamic> json) {
  return _Slides.fromJson(json);
}

/// @nodoc
mixin _$Slides {
  String get name => throw _privateConstructorUsedError;
  List<GYWDrawing> get drawings => throw _privateConstructorUsedError;

  /// Serializes this Slides to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Slides
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SlidesCopyWith<Slides> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlidesCopyWith<$Res> {
  factory $SlidesCopyWith(Slides value, $Res Function(Slides) then) =
      _$SlidesCopyWithImpl<$Res, Slides>;
  @useResult
  $Res call({String name, List<GYWDrawing> drawings});
}

/// @nodoc
class _$SlidesCopyWithImpl<$Res, $Val extends Slides>
    implements $SlidesCopyWith<$Res> {
  _$SlidesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Slides
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? drawings = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      drawings: null == drawings
          ? _value.drawings
          : drawings // ignore: cast_nullable_to_non_nullable
              as List<GYWDrawing>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SlidesImplCopyWith<$Res> implements $SlidesCopyWith<$Res> {
  factory _$$SlidesImplCopyWith(
          _$SlidesImpl value, $Res Function(_$SlidesImpl) then) =
      __$$SlidesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<GYWDrawing> drawings});
}

/// @nodoc
class __$$SlidesImplCopyWithImpl<$Res>
    extends _$SlidesCopyWithImpl<$Res, _$SlidesImpl>
    implements _$$SlidesImplCopyWith<$Res> {
  __$$SlidesImplCopyWithImpl(
      _$SlidesImpl _value, $Res Function(_$SlidesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Slides
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? drawings = null,
  }) {
    return _then(_$SlidesImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      drawings: null == drawings
          ? _value._drawings
          : drawings // ignore: cast_nullable_to_non_nullable
              as List<GYWDrawing>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SlidesImpl with DiagnosticableTreeMixin implements _Slides {
  const _$SlidesImpl(
      {required this.name, required final List<GYWDrawing> drawings})
      : _drawings = drawings;

  factory _$SlidesImpl.fromJson(Map<String, dynamic> json) =>
      _$$SlidesImplFromJson(json);

  @override
  final String name;
  final List<GYWDrawing> _drawings;
  @override
  List<GYWDrawing> get drawings {
    if (_drawings is EqualUnmodifiableListView) return _drawings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drawings);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Slides(name: $name, drawings: $drawings)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Slides'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('drawings', drawings));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SlidesImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._drawings, _drawings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_drawings));

  /// Create a copy of Slides
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SlidesImplCopyWith<_$SlidesImpl> get copyWith =>
      __$$SlidesImplCopyWithImpl<_$SlidesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SlidesImplToJson(
      this,
    );
  }
}

abstract class _Slides implements Slides {
  const factory _Slides(
      {required final String name,
      required final List<GYWDrawing> drawings}) = _$SlidesImpl;

  factory _Slides.fromJson(Map<String, dynamic> json) = _$SlidesImpl.fromJson;

  @override
  String get name;
  @override
  List<GYWDrawing> get drawings;

  /// Create a copy of Slides
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SlidesImplCopyWith<_$SlidesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
