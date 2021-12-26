// ignore_for_file: prefer_const_constructors

import 'package:bloc_pattern/Business_Logic_Layer/cubit/characters_cubit.dart';
import 'package:bloc_pattern/Constants/Strings.dart';
import 'package:bloc_pattern/Data_Layer/Repository/CharctersRepository.dart';
import 'package:bloc_pattern/Data_Layer/WebServices/Charcters_WebServices.dart';
import 'package:bloc_pattern/Prsenntaion_layer/Screens/Characters_screen.dart';
import 'package:bloc_pattern/Prsenntaion_layer/Screens/CharctersDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersCubit charactersCubit;
  late CharctersRepository charctersRepository;

  AppRouter() {
    charctersRepository = CharctersRepository(CharctersWebServices());
    charactersCubit = CharactersCubit(charctersRepository);
  }

  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case charcterScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => charactersCubit,
                  child: CharctersScreen(),
                ));
      case charcterDetailsScreen:
        return MaterialPageRoute(builder: (_) => ChaectersDetailsScreen());
    }
  }
}
