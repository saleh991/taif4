
import 'package:equatable/equatable.dart';

import '../../../../models/add_guide_model.dart';
abstract class LocationsState extends Equatable{

  @override

  List<Object?> get props =>[];

}

class LocationsInitState extends LocationsState{



}

class LocationsLoadingState extends LocationsState{}

class GuidingLoadingState extends LocationsState{}

class LocationsSuccessState extends LocationsState{}

class GuidingSuccessState extends LocationsState{}

class LocationsErrorState extends LocationsState{}

class GuidingErrorState extends LocationsState{}

class GetLocationsCategoryLoadingState extends LocationsState{}

class GetLocationsCategorySuccessState extends LocationsState{}

class GetLocationsCategoryErrorState extends LocationsState{}


class HarajsLoadingState extends LocationsState{}

class HarajsSuccessState extends LocationsState{}

class HarajsErrorState extends LocationsState{}



class GetHarajCategoryIdLoadingState extends LocationsState{}

class GetHarajCategoryIdSuccessState extends LocationsState{}

class GetHarajCategoryIdErrorState extends LocationsState{}


class UserDataLoadingState extends LocationsState{}

class UserDataSuccessState extends LocationsState{}

class UserDataErrorState extends LocationsState{}

class ChangHarajState extends LocationsState{}
class ChangLocationsState extends LocationsState{}

class GetHarajCategoryLoadingState extends LocationsState{}

class GetHarajCategorySuccessState extends LocationsState{}

class GetHarajCategoryErrorState extends LocationsState{}

class EventSectionsLoadingState extends LocationsState{}

class EventSectionsSuccessState extends LocationsState{}

class EventSectionsErrorState extends LocationsState{}

class OfferSectionsLoadingState extends LocationsState{}

class OfferSectionsSuccessState extends LocationsState{}

class AddGuideLoadingState extends LocationsState{}

class AddGuideSuccessState extends LocationsState{
  AddGuideModel addGuideModel;
  AddGuideSuccessState(this.addGuideModel);
}

class AddGuideErrorState extends LocationsState{}

class AddLocationLoadingState extends LocationsState{}

class AddLocationSuccessState extends LocationsState{
}

class AddLocationErrorState extends LocationsState{}

class OfferSectionsErrorState extends LocationsState{}

class HarajsSectionsLoadingState extends LocationsState{}

class HarajsSectionsSuccessState extends LocationsState{}

class HarajsSectionsErrorState extends LocationsState{}

class EventLoadingState extends LocationsState{}

class EventSuccessState extends LocationsState{}

class EventErrorState extends LocationsState{}

class OfferLoadingState extends LocationsState{}

class OfferSuccessState extends LocationsState{}

class OfferErrorState extends LocationsState{}