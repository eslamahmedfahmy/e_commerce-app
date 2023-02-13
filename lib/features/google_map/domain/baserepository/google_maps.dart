import 'package:shop_app/features/google_map/domain/entites/place_details_google_maps.dart';
import 'package:shop_app/features/google_map/domain/entites/search_maps.dart';
import 'package:shop_app/features/google_map/domain/usescase/place_details_google_maps.dart';
import 'package:shop_app/features/google_map/domain/usescase/search_google_maps_use_case.dart';

abstract class GoogleMapsBaseRepository
{
  Future<List<SearchMaps>> searchInGoogleMaps(SearchMapsParameters parameters);
  Future<PlaceDetailsGoogleMaps> getPlaceDetailsInGoogleMaps(PlaceDetailsParameters parameters);
}