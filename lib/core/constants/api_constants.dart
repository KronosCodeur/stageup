class ApiConstants {
  static const String _apiBaseUrl = "https://stageup-api.dracarys.tech/api/v1";
  static const String loginEndpoint = "$_apiBaseUrl/UserAuth/Login";
  static const String registerEndpoint = "$_apiBaseUrl/UserAuth/Register";
  static const String uploadProfileEndpoint = "$_apiBaseUrl/Image/Upload";
  static const String profileBaseUrl = "$_apiBaseUrl/Image/Download?filename=";
  static const String getAllInternshipsEndpoint =
      "$_apiBaseUrl/Internship/GetAllPublished";
  static const String getAllDomainsEndpoint = "$_apiBaseUrl/Domain/GetAll";
  static const String getAllOptionsEndpoint = "$_apiBaseUrl/Option/GetAll";
  static const String getUserApplicationsEndpoint =
      "$_apiBaseUrl/Application/GetUserApplications";
}
