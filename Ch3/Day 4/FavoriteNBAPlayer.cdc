pub contract FavoriteNBAPlayer {

    pub var favoritePlayers: @{Address: NBAPlayer}
    pub var arrayOfPlayers: @[NBAPlayer]

    pub resource interface IPlayer {
        pub let firstName: String
        pub let lastName: String
        pub let number: Int

    }
    
    pub resource NBAPlayer: IPlayer {
        pub let firstName: String
        pub let lastName: String
        pub let number: Int
        pub var team: String

        pub init(_firstName: String, _lastName: String, _number: Int, _team: String) {
            self.firstName = _firstName
            self.lastName = _lastName
            self.number = _number
            self.team = _team
        }

        pub fun updateTeam(newTeam: String) {
            self.team = newTeam
        }
    }

    pub fun noInterface() {
        let player: @NBAPlayer <- create NBAPlayer(_firstName: "Kevin", _lastName: "Durant", _number: 35, _team: "Golden State Warriors")
        player.updateTeam(newTeam: "Brooklyn Nets")
        log(player.team)
        destroy player
    }

    pub fun yesInterface() {
        let player: @NBAPlayer{IPlayer} <- create NBAPlayer(_firstName: "Kevin", _lastName: "Durant", _number: 35, _team: "Golden State Warriors")
        player.updateTeam(newTeam: "Brooklyn Nets")
        log(player.team)
        destroy player
    }

    pub fun getReference(key: Address): &NBAPlayer {
        return &self.favoritePlayers[key] as &NBAPlayer
    }

    pub fun addFavoritePlayer(firstName: String, lastName: String, number: Int, team: String, account: Address) {
        let player <- create NBAPlayer(_firstName: firstName, _lastName: lastName, _number: number, _team: team) 
        self.favoritePlayers[account] <-! player
    }

    pub fun addPlayerToList(firstName: String, lastName: String, number: Int, team: String, account: Address) {
        let player <- create NBAPlayer(_firstName: firstName, _lastName: lastName, _number: number, _team: team) 
        self.arrayOfPlayers.append(<- player)
    }

    pub fun removePlayerFromList(index: Int): @NBAPlayer {
        return <-self.arrayOfPlayers.remove(at: index)
    }

    pub fun removeFavoritePlayer(account: Address): @NBAPlayer {
        let oldFavorite <- self.favoritePlayers.remove(key: account) ?? panic("No favorite player")
        return <- oldFavorite
    }

    init() {
        self.favoritePlayers <- {}
        self.arrayOfPlayers <- []
    }
}
