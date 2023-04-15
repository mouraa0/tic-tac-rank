class ErrorInfo {
  final String msg;
  final String title;
  final bool canBeClosed;
  final String buttonTitle;
  final Function()? onButtonPressed;

  ErrorInfo({
    required this.msg,
    this.title = 'something went wrong :(',
    this.canBeClosed = true,
    this.buttonTitle = 'understood',
    this.onButtonPressed,
  });
}
