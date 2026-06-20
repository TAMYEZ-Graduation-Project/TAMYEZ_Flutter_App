sealed class CareerDetailsIntent {
  const CareerDetailsIntent();
}

class GetCareerDetailsIntent extends CareerDetailsIntent {
  final String careerId;

  const GetCareerDetailsIntent({required this.careerId});
}
