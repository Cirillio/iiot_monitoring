import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../storage/prefs_provider.dart';

part 'api_client.g.dart';

@riverpod
class BaseUrl extends _$BaseUrl {
  static const _key = 'backend_base_url';

  @override
  String build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getString(_key) ?? 'http://10.0.2.2:5000';
  }

  Future<void> setUrl(String url) async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setString(_key, url);
    state = url;
  }
}

@riverpod
Dio dio(Ref ref) {
  final url = ref.watch(baseUrlProvider);
  final dio = Dio(
    BaseOptions(
      baseUrl: url,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  return dio;
}
