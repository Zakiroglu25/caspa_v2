class Status {
  int? id;
  String? status;

  Status({
    this.id,
    this.status,
  });

  @override
  String toString() {
    return 'MyUser{id: $id, status: $status}';
  }
}
