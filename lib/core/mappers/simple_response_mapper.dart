import '../entities/simple_api_response_entity.dart'
    show SimpleApiResponseEntity;
import '../network/models/simple_api_response.dart';

extension SimpleResponseMapper on SimpleApiResponse {
  SimpleApiResponseEntity toEntity() {
    return SimpleApiResponseEntity(success: success, message: message);
  }
}
