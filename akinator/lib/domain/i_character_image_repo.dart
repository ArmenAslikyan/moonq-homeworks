abstract interface class ICharacterImageRepo {
  ICharacterImageRepo();
  Future<String?> getImageUrl(String characterName);
}
