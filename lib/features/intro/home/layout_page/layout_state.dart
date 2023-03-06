part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {}

class LayoutInitial extends LayoutState {}
class LayoutChangeScreenState extends LayoutState {}


class LayoutGitUserDataLodingState extends LayoutState {}
class LayoutGitUserDataSuccessState extends LayoutState {}
class LayoutGitUserDataErrorState extends LayoutState {}

class LayoutAddPostState extends LayoutState {}


class LayoutGetImageSuccessState extends LayoutState {}
class LayoutGetImageErrorState extends LayoutState {}
class LayoutGetImageCoverSuccessState extends LayoutState {}
class LayoutGetImageCoverErrorState extends LayoutState {}


class LayoutUploadImageProfileSuccessState extends LayoutState {}
class LayoutUploadImageProfileErrorState extends LayoutState {}
class LayoutUploadImageCoverSuccessState extends LayoutState {}
class LayoutUploadImageCoverErrorState extends LayoutState {}


class LayoutGetDownloadURLSuccessState extends LayoutState {}
class LayoutGetDownloadURLErrorState extends LayoutState {}



class LayoutUpDateUserErrorState extends LayoutState {}
class LayoutUpDateUserLodingState extends LayoutState {}
