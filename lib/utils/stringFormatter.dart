String stringFormatter(String str, int limit) {
  return str.length > limit ? str.substring(0, limit).trim() + "..." : str;
}
