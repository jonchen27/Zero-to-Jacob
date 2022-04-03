import FavoriteNBAPlayer from 0x01

transaction(firstName: String, lastName: String, number: Int, team: String, account: Address) {
    prepare(signer: AuthAccount) {
      let player <- FavoriteNBAPlayer.createPlayer(firstName: firstName, lastName: lastName, number: number, team: team)
      signer.save<@FavoriteNBAPlayer.NBAPlayer>(<- player, to: /storage/myPlayer)
      let loaded <- signer.load<@FavoriteNBAPlayer.NBAPlayer>(from:/storage/myPlayer) ?? panic("No NBA Player")
      log(loaded.lastName)
      destroy loaded
    }

    execute {
    }
}