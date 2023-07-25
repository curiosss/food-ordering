String? validatePhone(String? p0) {
  if (p0 == null || p0.isEmpty) {
    return "Required to fill";
  } else if (p0.length < 8) {
    return "Enter phone completely";
  }
  return null;
}

String? validateMin3(String? p0) {
  if (p0 == null || p0.isEmpty) {
    return "Required to fill";
  } else if (p0.length < 3) {
    return "Should be at least 3 letters";
  }
  return null;
}

String? validateMin8(String? p0) {
  if (p0 == null || p0.isEmpty) {
    return "Required to fill";
  } else if (p0.length < 8) {
    return "Should be at least 8 letters";
  }
  return null;
}
