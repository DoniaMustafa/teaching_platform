class PostRateParamsModel {
  final int? teacherId;
  final String? createdById;
  final DateTime? createdAt;
  final int? rate;

  PostRateParamsModel(
      {this.teacherId, this.createdById, this.createdAt, this.rate});
  Map<String, dynamic> toJson() => {
    "TeacherId": teacherId,
    "CreatedAt": createdAt,
    "CreatedById": createdById,
    "Rate": rate,
  };

}
