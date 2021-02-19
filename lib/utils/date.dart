String getMeridiem(DateTime dateTime) {
  return (dateTime.hour >= 12 ? "AM" : "PM");
}
