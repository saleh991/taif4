abstract class ServicesState {}

class ServicesInitState extends ServicesState{}

class ServicesLoadingState extends ServicesState{}

class ServicesSuccessState extends ServicesState{}

class ServicesErrorState extends ServicesState{}

class ServicesByCategoryLoadingState extends ServicesState{}

class ServicesByCategorySuccessState extends ServicesState{}

class ServicesByCategoryErrorState extends ServicesState{}

class ServicesCategoryLoadingState extends ServicesState{}

class ServicesCategorySuccessState extends ServicesState{}

class ServicesCategoryErrorState extends ServicesState{}

class ChangeServicesState extends ServicesState{}