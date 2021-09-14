abstract class PackagesState {}

class PackagesInitState extends PackagesState {}

class PackagesLoadingState extends PackagesState{}

class PackagesSuccessState extends PackagesState{}

class PackagesErrorState extends PackagesState{}
class LengthState extends PackagesState{}

class RequestPackagesLoadingState extends PackagesState{}

class RequestPackagesSuccessState extends PackagesState{}

class RequestPackagesErrorState extends PackagesState{}

class BankTransactionsLoadingState extends PackagesState{}

class BankTransactionsSuccessState extends PackagesState{}

class BankTransactionsErrorState extends PackagesState{}

class GetImagePackageSuccessState extends PackagesState{}

class GetImagePackageErrorState extends PackagesState{}