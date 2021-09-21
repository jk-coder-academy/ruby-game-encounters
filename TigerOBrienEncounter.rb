require_relative "../Encounter.rb"

class TigerOBrienEncounter < Encounter

    def initialize()
        @name = "local boxer"
        @encounter_intro = "The #{@name} has just finished their usual one-hour morning skipping-rope session and is saying aloud to themselves 'boy, I am really spoiling for a fight. In fact, I'll probably fight the next person I come across'.\n\nJust then, they hear you and turn around. They step in front of you, scowl and tell you to 'stick 'em up'. What do you do?\n\n"

        @options = []
        @options.push("Point behind the #{@name} and yell 'what's that?!', then run as fast as you can back in the direction you came.")
        @options.push("Take out your wallet and say 'here, take everything I have!'")
        @options.push("Pick up the nearest rock and hurl it as hard as you can at the #{@name}'s midriff.")
        @options.push("Gulp, take a deep breath, and raise your fists.")

        @consequences = []
        @consequences.push("\nYou run to safety. Phew. You go to sit on a log and catch your breath, but your shoelaces became untied during your run and you trip on them and fall down a ravine! You tumble to the bottom and lose 20 health in the process. The whole ordeal has cost you 10 stamina too. Ouch.\n\n")
        @consequences.push("\nThe #{@name} grabs your wallet and everything it contains. As they open it to look inside, you dash past safely.\n\n")
        @consequences.push("\nThe rock bounces off the #{@name}'s sturdy body. Uh oh, you've only made them angrier now. They walk toward you. But, in their anger, they don't see where the rock has landed and they trip on it and fall face-first in the ground. You edge past unscathed while they are still yelling muffled sounds into the ground.\n\n")
        @consequences.push("\nYou box like you've never boxed before and somehow defeat the #{@name}. You take 5 health damage and expend 15 stamina, but you've done yourself proud. You help yourself to the #{@name}'s gold on the way out - your first prize winnings ever.\n\n")
    
        @art = ""\
        "      ,-`-.\n"\
        "    ,' .__;\n"\
        "   /_ ,'@@,-.\n"\
        "   (C`____ -'\n"\
        "    \\ `--' ;\n"\
        "     ``:`:'\n"\
        "    .-`  '--.\n"\
        "   ( /7   \7 )\n"\
        "    \\i--._|/\n"\
        "   (,-,)   |\n"\
        "   ,--:_.  /\n"\
        "  (  ..__,/\n"\
        "   `-' ;  ``.\n"\
        "       `---`\n"\
    end

private
    def enact_consequences_of_players_choice(players_choice, player)
        case players_choice
            when 0
                player.take_damage(20)  
                player.exert_yourself(10)
            when 1
                player.lose_all_gold
            when 2
            when 3
                player.take_damage(5)
                player.exert_yourself(15)
                player.acquire_gold(12)
        end
    end

end