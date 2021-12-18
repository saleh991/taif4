import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part '../events/packes_mmeber_ship_event.dart';
part '../states/packes_mmeber_ship_state.dart';

class PackesMmeberShipBloc extends Bloc<PackesMmeberShipEvent, PackesMmeberShipState> {
  PackesMmeberShipBloc() : super(PackesMmeberShipInitial());

  @override
  Stream<PackesMmeberShipState> mapEventToState(
    PackesMmeberShipEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
