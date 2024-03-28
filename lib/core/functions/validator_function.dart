String? validator(String? value) {
  if (value?.isEmpty ?? true) {
    return 'Field is required';
  }
  return null;
}
