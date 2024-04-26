// ignore_for_file: public_member_api_docs, sort_constructors_first
class AboutState {
  String? about;
  bool? isMore;
  AboutState({this.about, this.isMore});

  AboutState copyWith({String? about, bool? isMore}) {
    return AboutState(
      about: about ?? this.about,
      isMore: isMore ?? this.isMore,
    );
  }
}
