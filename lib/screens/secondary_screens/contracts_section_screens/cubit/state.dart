abstract class RequestLeaseState {}

class RequestLeaseInitState extends RequestLeaseState {}

class RequestLeaseLoadingState extends RequestLeaseState {}

class RequestLeaseSuccessState extends RequestLeaseState {}

class RequestLeaseErrorState extends RequestLeaseState {}