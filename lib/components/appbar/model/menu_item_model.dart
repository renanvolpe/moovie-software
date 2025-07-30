import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter/material.dart';

class MenuItemModel extends Equatable{
  final String label;
  final VoidCallback onTap;
  final bool isSelected;

  const MenuItemModel({
    required this.label,
    required this.onTap,
    this.isSelected = false,
  });
  
  @override
  List<Object?> get props => [label];
}
