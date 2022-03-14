import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test2/data/models/characters.dart';
import 'package:test2/data/repo/characters_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository repository;
  List<Character> characters = [];
  CharactersCubit(this.repository)
      : super(CharactersInitial());
  List<Character> getAllCharacters() {
    repository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters; 
  }
}
