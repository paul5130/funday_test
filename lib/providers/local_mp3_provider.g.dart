// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_mp3_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loadLocalMp3)
const loadLocalMp3Provider = LoadLocalMp3Family._();

final class LoadLocalMp3Provider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  const LoadLocalMp3Provider._({
    required LoadLocalMp3Family super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'loadLocalMp3Provider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadLocalMp3Hash();

  @override
  String toString() {
    return r'loadLocalMp3Provider'
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
    return loadLocalMp3(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadLocalMp3Provider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadLocalMp3Hash() => r'44190fe86b81638e43a69985c9fd32bdc2e0e45e';

final class LoadLocalMp3Family extends $Family
    with $FunctionalFamilyOverride<FutureOr<String?>, String> {
  const LoadLocalMp3Family._()
    : super(
        retry: null,
        name: r'loadLocalMp3Provider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LoadLocalMp3Provider call(String id) =>
      LoadLocalMp3Provider._(argument: id, from: this);

  @override
  String toString() => r'loadLocalMp3Provider';
}
