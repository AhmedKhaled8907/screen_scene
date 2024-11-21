abstract class CustomFailure {
  final String message;
  CustomFailure(this.message);
}

class ServerFailure extends CustomFailure {
  ServerFailure(super.message);
}
