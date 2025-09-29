// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_downloaded_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(isDownloaded)
const isDownloadedProvider = IsDownloadedFamily._();

final class IsDownloadedProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  const IsDownloadedProvider._({
    required IsDownloadedFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'isDownloadedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isDownloadedHash();

  @override
  String toString() {
    return r'isDownloadedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    final argument = this.argument as String;
    return isDownloaded(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is IsDownloadedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isDownloadedHash() => r'c48b67db384343fbeb4281d0f4e2e0b0ca96205a';

final class IsDownloadedFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<String?>, String> {
  const IsDownloadedFamily._()
    : super(
        retry: null,
        name: r'isDownloadedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsDownloadedProvider call(String id) =>
      IsDownloadedProvider._(argument: id, from: this);

  @override
  String toString() => r'isDownloadedProvider';
}
