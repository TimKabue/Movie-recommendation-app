import 'package:flutter/foundation.dart';

@immutable //TODO: What is @immutable? *UNIDIRECTIONAL DATA FLOW*
class Genre {
  //---Instance fields
  final String name;
  final bool isSelected;
  final int id;

  //---Default Constructor
  const Genre({
    required this.name,
    this.id = 0,
    this.isSelected = false,
  });
  
  //---Instance method 'toggleSelected': Returns a Genre object
  Genre toggleSelected(){
    return Genre(name: name, id: id, isSelected: !isSelected);
  }

  @override
  String toString() => 'Genre(name: $name, isSelected: $isSelected, id: $id';

  @override
  bool operator == (Object other){
    if(identical(this,other)) return true;
    return other is Genre && other.name == name && other.isSelected == isSelected;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => name.hashCode ^ isSelected.hashCode ^ id.hashCode;

}
