enum InviteChannel { sms, email, link }

enum RelativeType { father, mother, brother, sister, son, daughter, spouse }

extension RelativeTypeLabel on RelativeType {
  String get label {
    switch (this) {
      case RelativeType.father:
        return 'Father';
      case RelativeType.mother:
        return 'Mother';
      case RelativeType.brother:
        return 'Brother';
      case RelativeType.sister:
        return 'Sister';
      case RelativeType.son:
        return 'Son';
      case RelativeType.daughter:
        return 'Daughter';
      case RelativeType.spouse:
        return 'Spouse';
    }
  }
}
