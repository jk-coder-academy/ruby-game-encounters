
class LeighPoulierEncounter < Encounter
    attr_reader :art              # Our sweet sweet ascii art.
    attr_reader :name             # The name of the encounter, duh!
    attr_reader :options          # The options, the player chooses!
    attr_reader :consequences     # The consequence of the players choice of options
    attr_reader :encounter_intro  # Intro for the encounter

    def initialize()
        @name = "Dragon Sleeping on a Hoard of Gold"
        # @art = ""\
        # "                                                       ____________\n"\
        # "                                 (`-..________....---''  ____..._.-`\n"\
        # "                                  \\\\`._______.._,.---'''     ,'\n"\
        # "                                  ; )`.      __..-'`-.      /\n"\
        # "                                 / /     _.-' _,.;;._ `-._,'\n"\
        # "                                / /   ,-' _.-'  //   ``--._``._\n"\
        # "                              ,','_.-' ,-' _.- (( =-    -. `-._`-._____\n"\
        # "                            ,;.''__..-'   _..--.\\\\.--'````--.._``-.`-._`.\n"\
        # "             _          |\\,' .-''        ```-'`---'`-...__,._  ``-.`-.`-.`.\n"\
        # "  _     _.-,'(__)\\__)\\-'' `     ___  .          `     \\      `--._\n"\
        # ",',)---' /|)          `     `      ``-.   `     /     /     `     `-.\n"\
        # "\\_____--.  '`  `               __..-.  \\     . (   < _...-----..._   `.\n"\
        # " \\_,--..__. \\\\ .-`.\\----'';``,..-.__ \\  \\      ,`_. `.,-'`--'`---''`.  )\n"\
        # "           `.\\`.\\  `_.-..' ,'   _,-..'  /..,-''(, ,' ; ( _______`___..'__\n"\
        # "                   ((,(,__(    ((,(,__,'  ``'-- `'`.(\\  `.,..______   SSt\n"\
        # "                                                      ``--------..._``--.__\n"
        @art = File.open("ruby-game-encounters/LeighPoulierArt.txt").read
        @encounter_intro = "You stumble into a cavern, and at the centre is huge pile of gold.\nBut on top of the gold is a huge sleeping dragon!\nAs it stirs, a gold coin rolls to your feet."
        
        @options = []
        @consequences = []
        @consequences_actions = []

        @options.push("Sneak up to the dragon and collect as much gold as you can carry.")
        random = rand(5)
        case random
        when 0..1
            @consequences.push(\
                "You collect 10 gold, but just as you reach for the 11th the dragon wakes up and sees you stealing its gold!\n"\
                "You barely escape alive, and all your clothes are burnt off, but you manage to hang on to the gold.\n"\
                "(-50 health, -50 stamina, +10 gold)")
            @consequences_actions.push( ->(player) {\
                player.take_damage(50)
                player.exert_yourself(50)
                player.acquire_gold(10)
                })
        when 2..3
            @consequences.push(\
                "You collect 10 gold, but just as you reach for the 11th the dragon wakes up and sees you stealing its gold!\n"\
                "You barely escape alive, and all your clothes are burnt off, and you drop all of the gold.\n"\
                "(-50 health, -50 stamina, +0 gold)")
            @consequences_actions.push( ->(player) {
                player.take_damage(50)
                player.exert_yourself(50)
            })
        when 4
            @consequences.push(\
                "You collect 20 gold, and are super quiet.  The dragon doesn't wake up!  You tiptoe out of the cavern.\n"\
                "(+0 health, +0 stamina, +20 gold)")
            @consequences_actions.push( ->(player) {
                player.acquire_gold(20)
            })
        end
            
            
        @options.push("Take the gold coin at your feet, and leave as quickly as possible.")
        random = rand(2)
        case random
        when 0
            @consequences.push(\
                "You manage to leave the cavern without waking the dragon\n"\
                "(+1 gold)",)
            @consequences_actions.push( ->(player) {
                player.acquire_gold(1)
            })
        when 1
            @consequences.push(\
                "The dragon wakes up when it hears the gold coin scrape on the stone floor of the cavern.\n"\
                "It breathes fire at you, but you manage to escape with only minor burns\n"\
                "(-5 health, +1 gold)")
            @consequences_actions.push( ->(player) {
                player.take_damage(5)
                player.acquire_gold(1)
            })
        end
        

        @options.push("Back away slowly, trying not to wake the dragon")
        @consequences.push(\
            "While walking backwards, you trip and land on your bum. \n"\
            "The dragon wakes up, looks you straight in the eye, but can't be bothered interrupting its nap and goes back to sleep. You shuffle out backwards on your bum.\n"\
            "(-5 stamina)")
        @consequences_actions.push( ->(player) {
            player.exert_yourself(5)
        })


        @options.push("Say \"DRACARYS\" in a commanding tone")
        random = rand(3)
        case random
        when 0
            @consequences.push(\
                "The dragon wakes up, looks you straight in the eye and telepathically thinks to you \"You're not my mother, but i like the pop culture reference\".\n"\
                "The dragon rewards you by magically healing you\n"\
                "(+50 health, +50 stamina)")
            @consequences_actions.push( ->(player) {
                player.heal(50)
                player.rejuvinate(50)
            })
        when 1..2
            @consequences.push(\
                "The dragon jumps to attention and shoots fire, causing the cavern to shake and rocks to fall from the ceiling.\n"\
                "You are injured by a falling rock as you run from the cavern\n"\
                "(-20 health)")
            @consequences_actions.push( ->(player) {
                player.take_damage(20)
            })
        end
    end

    def enact_consequences_of_players_choice(players_choice, player)

        @consequences_actions[players_choice].call(player)

    end

end
