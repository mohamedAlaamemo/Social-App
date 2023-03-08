part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {}

class LayoutInitial extends LayoutState {}
class LayoutChangeScreenState extends LayoutState {}

// Get all information about user
class LayoutGitUserDataLodingState extends LayoutState {}
class LayoutGitUserDataSuccessState extends LayoutState {}
class LayoutGitUserDataErrorState extends LayoutState {}

//Post Page
class LayoutScreenOfAddPostState extends LayoutState {}


class LayoutGetImageSuccessState extends LayoutState {}
class LayoutGetImageErrorState extends LayoutState {}



class LayoutGetImageCoverSuccessState extends LayoutState {}
class LayoutGetImageCoverErrorState extends LayoutState {}


class LayoutGetImageNewPostSuccessState extends LayoutState {}
class LayoutGetImageNewPostErrorState extends LayoutState {}

class LayoutRemoveImageNewPostState extends LayoutState {}


class LayoutUploadImageProfileSuccessState extends LayoutState {}
class LayoutUploadImageProfileErrorState extends LayoutState {}


class LayoutUploadImageCoverSuccessState extends LayoutState {}
class LayoutUploadImageCoverErrorState extends LayoutState {}


class LayoutGetDownloadURLSuccessState extends LayoutState {}
class LayoutGetDownloadURLErrorState extends LayoutState {}


class LayoutUpDateUserErrorState extends LayoutState {}
class LayoutUpDateUserLodingState extends LayoutState {}



//CreateNewPost

class LayoutCreateNewPostLodingState extends LayoutState {}
class LayoutCreateNewPostSuccessState extends LayoutState {}
class LayoutCreateNewPostErrorState extends LayoutState {}


class LayoutUploadImageNewPostLodingState extends LayoutState {}
class LayoutUploadImageNewPostSuccessState extends LayoutState {}
class LayoutUploadImageNewPostErrorState extends LayoutState {}



class LayoutGetAllPostsLodingState extends LayoutState {}
class LayoutGetAllPostsSuccessState extends LayoutState {}
class LayoutGetAllPostsErrorState extends LayoutState {}


class LayoutLikePostLodingState extends LayoutState {}
class LayoutLikePostSuccessState extends LayoutState {}
class LayoutLikePostErrorState extends LayoutState {}
