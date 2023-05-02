import 'package:flutter/cupertino.dart';
import 'package:trevalapp2/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trevalapp2/services/place_data_service.dart';

/*class PlaceRepo extends ChangeNotifier {
  List<Place> places = [];
  var place;
  final PlaceDataService placeDataService;

  PlaceRepo(this.placeDataService);

  Future<List<Place>> getPlaces() async {
    places = await placeDataService.getPlaces();
    notifyListeners();
    return places;
  }

  Future<Place> getPlace(int id) async {
    place = await placeDataService.getPlace(id);
    notifyListeners();
    return place;
  }

  addPlace(Place place) async {
    await placeDataService.addPlace(place);
    notifyListeners();
  }
}*/


final FutureProvider<List<Place>> placeListProvider =
FutureProvider((ref) async {
  return ref.read(placeDataProvider).getPlaces();
});