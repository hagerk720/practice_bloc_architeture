import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2/business_logic/cubit/characters_cubit.dart';
import 'package:test2/constants/strings.dart';
import 'package:test2/data/repo/characters_repo.dart';
import 'package:test2/data/webService/characters_web_service.dart';

import 'presentation/screens/character_details.dart';
import 'presentation/screens/characters_screen.dart';

class AppRouter {
  late CharactersCubit charactersCubit;
  late CharactersRepository charactersRepository;
  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case allCharactersRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );
        
      case characterDetailScreen:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
    }
  }
}
