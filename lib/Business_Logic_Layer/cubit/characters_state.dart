part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharctersLoaded extends CharactersState {
  final List<CharcterModel> charcters;

  CharctersLoaded(this.charcters);
}

class CharctersFailed extends CharactersState {}

class CharctersLoading extends CharactersState {}
