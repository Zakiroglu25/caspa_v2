abstract class AuthenticationState {}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}
class AuthenticationCustomerMode extends AuthenticationState {}
class AuthenticationServerError extends AuthenticationState {}
class AuthenticationOnboarding extends AuthenticationState {}
class AuthenticationLoading extends AuthenticationState {}
class AuthenticationSplash extends AuthenticationState {}
class AuthenticationError extends AuthenticationState {}
class AuthenticationNetworkError extends AuthenticationState {}
