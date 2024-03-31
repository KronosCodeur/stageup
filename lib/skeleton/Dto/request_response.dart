class RequestResponse {
  bool success;
  String message;
  RequestResponse({required this.success, required this.message});

  factory RequestResponse.fromJson(Map<String, dynamic> json) {
    return RequestResponse(
      success: json['success'],
      message: json['message'],
    );
  }
}
