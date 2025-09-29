// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_mp3_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(downloadMp3)
const downloadMp3Provider = DownloadMp3Family._();

final class DownloadMp3Provider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  const DownloadMp3Provider._({
    required DownloadMp3Family super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'downloadMp3Provider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$downloadMp3Hash();

  @override
  String toString() {
    return r'downloadMp3Provider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    final argument = this.argument as (String, String);
    return downloadMp3(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is DownloadMp3Provider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$downloadMp3Hash() => r'142f09ea37d76df831624623b5c481bdd1b595f6';

final class DownloadMp3Family extends $Family
    with $FunctionalFamilyOverride<FutureOr<String?>, (String, String)> {
  const DownloadMp3Family._()
    : super(
        retry: null,
        name: r'downloadMp3Provider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DownloadMp3Provider call(String url, String id) =>
      DownloadMp3Provider._(argument: (url, id), from: this);

  @override
  String toString() => r'downloadMp3Provider';
}
