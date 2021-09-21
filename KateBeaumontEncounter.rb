require_relative "../Encounter"
class KateBeaumontEncounter < Encounter

    def initialize()
        @name = "goose"
        @encounter_intro = "You find a snow white #{@name} perched on a nest of fine twigs and bark. The goose eyes you disparagingly. The goose may be a golden goose, but it may also be cursed."
        
        @options = []
        @options.push("Pat the goose, hoping it produces a golden egg.")
        @options.push("Hit the goose, hoping it hops off a golden egg.")
        @options.push("Walk away.")
        @options.push("Start a conversation about kafkaesque symbolism.")
        
        @consequences = []
        @consequences.push("The goose responds angrily and pecks you. You lose 10 damage and cost 1 stamina protecting yourself.")
        @consequences.push("The goose is taken by surprise and pecks you but you craftily grab the shiny golden egg on which it sat. You gain 10 gold but take 10 damage.")
        @consequences.push("You walk away.")
        @consequences.push("The goose is an expert in Kafka. In a multi-day discourse regarding the dichotomy of human needs versus wants you realise your need to rest. The conversation stimulates you, and you gain 10 health[not yet implimented - waiting on method].")

        @art = ""\
        "     _.-.\n"\
        "__.-' ,  \\\n"\
       "'--'-'._  \\\n"\
        "       '.  \\\n"\
        "        )-- \ __.--._\n"\
        "       /   .'        '--.\n"\
        "      .               _/-._\n"\
        "      :       ____._/   _-'\n"\
        "       '._          _.'-'\n"\
        "          '-._    _.'\n"\
        "              \_|/\n"\
        "             __|||\n"\
        "             >__/'\n"
    end

    # The player enters the encounter, lets start!
    def enact_consequences_of_players_choice(players_choice, player)
          
        #Apply consiquences
        case players_choice
            when 0
                player.exert_yourself(1)
                player.take_damage(10)
            when 1
                player.acquire_gold(10)
                player.take_damage(10)           
            when 2
            when 3
                #player.add_health(10)
        end
    end
end