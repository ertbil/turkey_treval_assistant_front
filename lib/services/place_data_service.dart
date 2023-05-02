import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trevalapp2/models/place.dart';

import '../constants/strings/paths.dart';
import 'main_data_service.dart';

class PlaceDataService {

  Future<List<Place>> getPlaces() async {
    var decodedData = await MainDataService.get(Paths.places);
    return decodedData.map<Place>((element) {
      return Place.fromJson(element);
    }).toList();
  }

  Future<Place> getPlace(int id) async {
    var decodedData = await MainDataService.get('${Paths.places}/$id');
    return Place.fromJson(decodedData);
  }

  addPlace(Place place) async {
    await MainDataService.post(Paths.places, place.toJson());
  }

  updatePlace(Place place) async {
    await MainDataService.put('${Paths.places}/${place.id}', place.toJson());
  }

  deletePlace(int id) async {
    await MainDataService.delete('${Paths.places}/$id');
  }


}
final placeDataProvider = Provider<PlaceDataService>((ref) {
  return PlaceDataService();
});