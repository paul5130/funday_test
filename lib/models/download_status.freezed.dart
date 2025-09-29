// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DownloadStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DownloadStatus()';
}


}

/// @nodoc
class $DownloadStatusCopyWith<$Res>  {
$DownloadStatusCopyWith(DownloadStatus _, $Res Function(DownloadStatus) __);
}


/// Adds pattern-matching-related methods to [DownloadStatus].
extension DownloadStatusPatterns on DownloadStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DownloadStatusNotDownloaded value)?  notDownloaded,TResult Function( DownloadStatusDownloading value)?  downloading,TResult Function( DownloadStatusDownloaded value)?  downloaded,TResult Function( DownloadStatusFailed value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DownloadStatusNotDownloaded() when notDownloaded != null:
return notDownloaded(_that);case DownloadStatusDownloading() when downloading != null:
return downloading(_that);case DownloadStatusDownloaded() when downloaded != null:
return downloaded(_that);case DownloadStatusFailed() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DownloadStatusNotDownloaded value)  notDownloaded,required TResult Function( DownloadStatusDownloading value)  downloading,required TResult Function( DownloadStatusDownloaded value)  downloaded,required TResult Function( DownloadStatusFailed value)  error,}){
final _that = this;
switch (_that) {
case DownloadStatusNotDownloaded():
return notDownloaded(_that);case DownloadStatusDownloading():
return downloading(_that);case DownloadStatusDownloaded():
return downloaded(_that);case DownloadStatusFailed():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DownloadStatusNotDownloaded value)?  notDownloaded,TResult? Function( DownloadStatusDownloading value)?  downloading,TResult? Function( DownloadStatusDownloaded value)?  downloaded,TResult? Function( DownloadStatusFailed value)?  error,}){
final _that = this;
switch (_that) {
case DownloadStatusNotDownloaded() when notDownloaded != null:
return notDownloaded(_that);case DownloadStatusDownloading() when downloading != null:
return downloading(_that);case DownloadStatusDownloaded() when downloaded != null:
return downloaded(_that);case DownloadStatusFailed() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  notDownloaded,TResult Function()?  downloading,TResult Function( String filePath)?  downloaded,TResult Function( String? message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DownloadStatusNotDownloaded() when notDownloaded != null:
return notDownloaded();case DownloadStatusDownloading() when downloading != null:
return downloading();case DownloadStatusDownloaded() when downloaded != null:
return downloaded(_that.filePath);case DownloadStatusFailed() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  notDownloaded,required TResult Function()  downloading,required TResult Function( String filePath)  downloaded,required TResult Function( String? message)  error,}) {final _that = this;
switch (_that) {
case DownloadStatusNotDownloaded():
return notDownloaded();case DownloadStatusDownloading():
return downloading();case DownloadStatusDownloaded():
return downloaded(_that.filePath);case DownloadStatusFailed():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  notDownloaded,TResult? Function()?  downloading,TResult? Function( String filePath)?  downloaded,TResult? Function( String? message)?  error,}) {final _that = this;
switch (_that) {
case DownloadStatusNotDownloaded() when notDownloaded != null:
return notDownloaded();case DownloadStatusDownloading() when downloading != null:
return downloading();case DownloadStatusDownloaded() when downloaded != null:
return downloaded(_that.filePath);case DownloadStatusFailed() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class DownloadStatusNotDownloaded extends DownloadStatus {
  const DownloadStatusNotDownloaded(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadStatusNotDownloaded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DownloadStatus.notDownloaded()';
}


}




/// @nodoc


class DownloadStatusDownloading extends DownloadStatus {
  const DownloadStatusDownloading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadStatusDownloading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DownloadStatus.downloading()';
}


}




/// @nodoc


class DownloadStatusDownloaded extends DownloadStatus {
  const DownloadStatusDownloaded({required this.filePath}): super._();
  

 final  String filePath;

/// Create a copy of DownloadStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadStatusDownloadedCopyWith<DownloadStatusDownloaded> get copyWith => _$DownloadStatusDownloadedCopyWithImpl<DownloadStatusDownloaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadStatusDownloaded&&(identical(other.filePath, filePath) || other.filePath == filePath));
}


@override
int get hashCode => Object.hash(runtimeType,filePath);

@override
String toString() {
  return 'DownloadStatus.downloaded(filePath: $filePath)';
}


}

/// @nodoc
abstract mixin class $DownloadStatusDownloadedCopyWith<$Res> implements $DownloadStatusCopyWith<$Res> {
  factory $DownloadStatusDownloadedCopyWith(DownloadStatusDownloaded value, $Res Function(DownloadStatusDownloaded) _then) = _$DownloadStatusDownloadedCopyWithImpl;
@useResult
$Res call({
 String filePath
});




}
/// @nodoc
class _$DownloadStatusDownloadedCopyWithImpl<$Res>
    implements $DownloadStatusDownloadedCopyWith<$Res> {
  _$DownloadStatusDownloadedCopyWithImpl(this._self, this._then);

  final DownloadStatusDownloaded _self;
  final $Res Function(DownloadStatusDownloaded) _then;

/// Create a copy of DownloadStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filePath = null,}) {
  return _then(DownloadStatusDownloaded(
filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DownloadStatusFailed extends DownloadStatus {
  const DownloadStatusFailed({this.message}): super._();
  

 final  String? message;

/// Create a copy of DownloadStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadStatusFailedCopyWith<DownloadStatusFailed> get copyWith => _$DownloadStatusFailedCopyWithImpl<DownloadStatusFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadStatusFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DownloadStatus.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $DownloadStatusFailedCopyWith<$Res> implements $DownloadStatusCopyWith<$Res> {
  factory $DownloadStatusFailedCopyWith(DownloadStatusFailed value, $Res Function(DownloadStatusFailed) _then) = _$DownloadStatusFailedCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$DownloadStatusFailedCopyWithImpl<$Res>
    implements $DownloadStatusFailedCopyWith<$Res> {
  _$DownloadStatusFailedCopyWithImpl(this._self, this._then);

  final DownloadStatusFailed _self;
  final $Res Function(DownloadStatusFailed) _then;

/// Create a copy of DownloadStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(DownloadStatusFailed(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
