
class CLI
    
    def call
        self.greeting
        self.input_selector
        puts "Would you like a new search? [y/n]".yellow
        ans = gets.strip.downcase
        while ans != "y" && ans != "n"
            puts "Didn't catch that try \"y\" or \"n\"".yellow
            ans = gets.strip.downcase
        end
        while ans == "y" && ans != "n"
            self.input_selector
            puts "Would you like a new search? [y/n]".yellow
            ans = gets.strip.downcase
            while !["y", "n"].include?(ans)
                puts "Didn't catch that try \"y\" or \"n\"".yellow
                ans = gets.strip.downcase
            end
        end
        self.salutations
    end
    
    def input_selector
        puts "How would you like to input a Superhero or Villain? (\"enter a name\", \"by studio\", or \"random list\")".yellow
        choice = gets.strip.downcase
        while !["enter a name", "by studio", "random list"].include?(choice)
            puts "oops lets try that again. (\"enter a name\", \"by studio\", or \"random list\")".yellow
            choice = gets.strip.downcase
        end
        if choice == "enter a name"
            self.input_enter
        elsif choice == "by studio"
            self.input_studio
        elsif choice == "random list"
            self.input_random
        end
    end
    
    def input_enter
        puts "please enter the name of the Superhero:".yellow
        hero = gets.strip
        a = Super.new(hero)
        while a.name == false
            puts "I'm sorry I am unable to find infoermation on that hero, let's try another: [enter hero name]".yellow
            hero = gets.strip
            a = Super.new(hero)
        end
        puts a.gen_info
    end
    
    def input_studio
        puts "thank you for selecting, by studio.  Please chose either \"DC\" or \"Marvel\"".yellow
        stud = gets.strip.downcase
        while !["dc", "marvel"].include?(stud)
            puts "oops lets try again. Please chose either \"DC\" or \"Marvel\"".yellow
            stud = gets.strip.downcase
        end
        if stud == "dc"
            a = Super::dc_list
        elsif stud == "marvel"
            a = Super::m_list
        end
        display_studio(a)
    end
    
    def display_studio(stud_array)
        dis_array = stud_array.each_slice(10).to_a
        i = 0
        while i < dis_array.length
            puts dis_array[i]
            puts "displaying  [#{i + 1} // #{dis_array.length + 1}]  pages".light_blue
            puts "please enter a heroes name, \"next\" for next page of heroes, or \"exit\" to exit the program and be offered a new search".yellow
            input = gets.strip.downcase
            while ![ "next", "exit"].include?(input) && Super.new(input).name == false
                puts "I'm sorry either your hero selection was invalid or I didnt understand your request".yellow
                puts "please enter a heroes name, \"next\" for next page of heroes, or \"exit\" to exit the the current seach and be offered a new search".yellow
                input = gets.strip.downcase
            end
            if input == "exit"
                break
            elsif Super.new(input).name != false
                puts Super.new(input).gen_info
                break
            end
            i += 1
        end
    end
    
    def input_random
        a = Super::m_list
        b = Super::dc_list
        c = a.concat(b)
        c.shuffle!
        puts "thank you for chosing the random list input method, here are a list of heroes to chose from, simply enter the Hero's name:".yellow
        display_studio(a)
    end
    
    def salutations
        puts "Thank you for visiting my app, please leave any comments on my github.  [details in README]".light_blue
        puts "COME BACK SOON!".light_blue
    end
    
    def greeting
        puts '
                
     /\/|____ _   _______ ___________   _____ _____ _      _____ _____ _____ ___________ /\/|
    |/\/  ___| | | | ___ \  ___| ___ \ /  ___|  ___| |    |  ___/  __ \_   _|  _  | ___ \/\/ 
       \ `--.| | | | |_/ / |__ | |_/ / \ `--.| |__ | |    | |__ | /  \/ | | | | | | |_/ /    
        `--. \ | | |  __/|  __||    /   `--. \  __|| |    |  __|| |     | | | | | |    /     
       /\__/ / |_| | |   | |___| |\ \  /\__/ / |___| |____| |___| \__/\ | | \ \_/ / |\ \     
       \____/ \___/\_|   \____/\_| \_| \____/\____/\_____/\____/ \____/ \_/  \___/\_| \_|    
                                                                                             
                                                                                                 
        '.yellow
    end
end
