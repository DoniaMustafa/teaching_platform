class PostParamsResumeModel {
  final String? phoneNumber;
  final bool? isExternalLink;
  final String? certificate;
  final String? cV;
  final String? intro;

  PostParamsResumeModel({this.phoneNumber,
    this.isExternalLink,
    this.certificate,
    this.cV,
    this.intro});

  Map<String, dynamic> toJson() =>
      {
        "PhoneNumber": phoneNumber,
        "IsExternalLink": isExternalLink,
        "Certificate": certificate,
        "CV": cV,
        "Intro": intro,
      };
}
