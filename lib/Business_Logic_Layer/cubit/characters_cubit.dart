import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/Data_Layer/Models/CharcterModel.dart';
import 'package:bloc_pattern/Data_Layer/Repository/CharctersRepository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharctersRepository charctersRepository;
  late List<CharcterModel> fetchedCharcters = [];

  CharactersCubit(this.charctersRepository) : super(CharactersInitial());

  List<CharcterModel> getAllCharcters() {
    charctersRepository.getAllCharcters().then((result) {
      emit(CharctersLoaded(result));
      fetchedCharcters = result;
    });
    return fetchedCharcters;
  }
}
