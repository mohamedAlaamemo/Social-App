part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {}

class LayoutInitial extends LayoutState {}
class LayoutChangeScreenState extends LayoutState {}


class LayoutGitUserDataLodingState extends LayoutState {}
class LayoutGitUserDataSuccessState extends LayoutState {}
class LayoutGitUserDataErrorState extends LayoutState {}

class LayoutAddPostState extends LayoutState {}
