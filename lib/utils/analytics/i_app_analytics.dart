abstract class IAppAnalytics {
  Future<void> logEvent(String name, {Map<String, dynamic> params});
  Future<void> setUserIdentifier(String userId);
  Future<void> setCrashlyticsCustomKeys();
  Future<void> setUserProperty(String name, String value);
  Future<void> setUserPropertiesList(Map<String, dynamic> userProperties);
  Future<void> logError(dynamic exception, StackTrace stackTrace, {String errorMessage});
}
