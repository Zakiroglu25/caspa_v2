class Status {
  int? id;
  String? status;
  String? step;

  Status({
    this.id,
    this.status,
    this.step,
  });

  @override
  String toString() {
    return 'Status{id: $id, key: $status, status: $step}';
  }
}
