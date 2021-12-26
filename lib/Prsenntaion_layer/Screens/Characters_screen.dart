// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, non_constant_identifier_names

import 'package:bloc_pattern/Business_Logic_Layer/cubit/characters_cubit.dart';
import 'package:bloc_pattern/Constants/Colors.dart';
import 'package:bloc_pattern/Data_Layer/Models/CharcterModel.dart';
import 'package:bloc_pattern/Prsenntaion_layer/Widgets/GridViewItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharctersScreen extends StatefulWidget {
  const CharctersScreen({Key? key}) : super(key: key);

  @override
  State<CharctersScreen> createState() => _CharctersScreenState();
}

class _CharctersScreenState extends State<CharctersScreen> {
  late List<CharcterModel> allCharcters;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharcters();
  }

  Widget BuildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharctersLoaded) {
        allCharcters = (state).charcters;
        return buildlistbody();
      } else {
        return CircularProgressIndicator();
      }
    });
  }

  Widget buildlistbody() {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(10.0),
      child: CharctersGridList(),
    ));
  }

  Widget CharctersGridList() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2 / 3, crossAxisSpacing: 1),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: allCharcters.length,
        itemBuilder: (context, index) {
          return GridViewItemWidget(
            item: allCharcters[index],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Charcters",
            style: TextStyle(color: MyColors.grey),
          ),
          centerTitle: true,
          backgroundColor: MyColors.yellow),
      body: Center(
        child: Container(child: BuildBlocWidget()),
      ),
    );
  }
}
