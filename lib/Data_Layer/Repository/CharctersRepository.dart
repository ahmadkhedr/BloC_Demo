import 'package:bloc_pattern/Data_Layer/Models/CharcterModel.dart';
import 'package:bloc_pattern/Data_Layer/WebServices/Charcters_WebServices.dart';

class CharctersRepository {
  final CharctersWebServices charctersWebServices;

  CharctersRepository(this.charctersWebServices);

  Future<List<CharcterModel>> getAllCharcters() async {
    final Charcters = await charctersWebServices.getAllCharcters();

    return Charcters.map(
        (character) => CharcterModel.fromJson(character)).toList();
  }
}
