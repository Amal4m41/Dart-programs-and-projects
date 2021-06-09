import 'dart:io';
import 'dart:math';


Map get_text(difficulty)  //to choose and return text:hint pair w.r.t the difficulty level chosen by the user.
{
  var text_map;
  if(difficulty==1)   // easy to guess movie titles
  {
    text_map={"Sherlock Holmes":"....a brilliant but eccentric private detective. Together they solve baffling, and often bizarre, murder mysteries. They also have to compete with Holmes nemesis, the criminal genius Moriarty.","Shutter island":"Teddy Daniels and Chuck Aule, two US marshals, are sent to an asylum on a remote island in order to investigate the disappearance of a patient, where Teddy uncovers a shocking truth about the place.","War":'Kabir, a secret agent, goes rogue after a mission to catch a terrorist goes awry. However, his boss sends Khalid, another agent and his student, to track him down.'};
  }
  else if(difficulty==2)
  {
    text_map={"Jack and the giant slayer":'Jack, a young farmhand, must save Princess Isabelle from the giants after one of the magic beans that a monk gives him in exchange of his horse sprouts a giant beanstalk into the realm of the giants.',"Inferno":'After waking up with amnesia in a hospital, Robert Langdon teams up with Sienna Brooks, one of his doctors, to protect the world from the evil plan of a mad scientist.',"The lost symbol":"......is best-selling author Dan Brown's third thriller novel following the life of symbologist Robert Langdon as he works to solve the mystery behind the disappearance of his mentor, Peter Solomon, whose severed hand is found in the Capitol Building in Washington DC during a Smithsonian fundraiser.","Super 30":'..... a mathematician from Patna, India, works his way through challenges towards success before running a programme for IIT aspirants in Patna.',"Avengers Endgame":'After an intergalactic warlord, disintegrates half of the universe, a team must reunite and assemble again to reinvigorate their trounced allies and restore balance.'};
  }
  else
  {
    text_map={"Anaconda chapter 2":'A large corporation sponsors a team of biologists to travel deep into the Amazon rainforest and retrieve a flower known as blood orchid, which could hold the key to everlasting youth.',"Once upon a time in Hollywood":"Actor Rick Dalton gained fame and fortune by starring in a 1950s television Western, but is now struggling to find meaningful work in a Hollywood that he doesn't recognize anymore","Jurrasic World":'A theme park showcasing genetically-engineered dinosaurs turns into a nightmare for its tourists when one of the dinosaurs escapes its enclosure.',"Andhadhun":'A piano player pretending to be visually-impaired, unwittingly becomes entangled in a number of problems as he witnesses the murder of a former film actor.',"Angels and Demons":"Robert, a symbologist, tries his best to stop a secret society from destroying Vatican City. He tries to decipher various clues in the process, most of which lead him to the four altars of science.","The Da vinci code":"Symbologist Robert Langdon travels from Paris to London to discover the truth behind a mysterious and bizarre murder. Later, he learns about a religious mystery protected by a secret society.","Zindagi na milegi dobara":"Friends Kabir, Imran and Arjun take a vacation in Spain before Kabir's marriage. The trip turns into an opportunity to mend fences, heal wounds, fall in love with life and combat their worst fears."};
  }

  var keys_list=text_map.keys.toList();   //getting a list of the set of keys
  var rng = new Random();  //creating an object of random number generator.
  var random_text_content=keys_list[rng.nextInt(keys_list.length)];  //choosing a key at random 

  return {random_text_content:text_map[random_text_content]};  //return a text:hint pair.
}


String get_hangman_states(chance_state)    //a fn to return hangman status w.r.t the number of chances left
{
  var list=[
'''
  _______
  |/     |
  |     ( )
  |     /|\\
  |      |
  |     / \\
  |
 _|___''',
'''
  _______
  |/     |
  |     ( )
  |      |\\
  |      |
  |     / \\
  |
 _|___''',
'''
  _______
  |/     |
  |     ( )
  |      |
  |      |
  |     / \\
  |
 _|___''',
'''
  _______
  |/     |
  |     ( )
  |      |
  |      |
  |     / 
  |
 _|___''', 
'''
  _______
  |/     |
  |     ( )
  |      |
  |      |
  |      
  |
 _|___''', 
'''
  _______
  |/     |
  |     ( )
  |     
  |     
  |     
  |
 _|___''',
'''
  _______
  |/     |
  |     
  |     
  |     
  |     
  |
 _|___'''   ];

  return list[chance_state];
}


List create_hangman(text)     //returns the text(word to be guessed) as list of dashes
{
  var list=[];                     //to create a list of dashes
  for(var i=0;i<text.length;i++)
  {
    if(text[i]!=" "){
      list.add("_");
    }
    else
    {
      list.add(" ");
    }
  }

  return list;
}


void check_and_display(text,hint_text,list_dashes)        //checks puzzle solution and displays hangman/game status(win,lose,how many chances left? etc) 
{
  // print(text);  //prints the answer(for debugging purpose)
  var chance=6;
  var win=false;
  var char_input="";
  var hint="n";
  print("I'm thinking of a movie, can you guess it?\n");
  while(chance>0 && !win)   //run while as long as there's chance left and the puzzle is not solved.
  {     
    print(get_hangman_states(chance));   //prints the current status of the hangman
    if(chance!=6){
          print("Chances left : $chance");
    }
    print(list_dashes.join(" "));
    print("Enter character : ");
    char_input=(stdin.readLineSync() as String).toLowerCase();   //get the input string from the user(casting String? to String) and covert to lowercase.
    print("\n");

    //check if it's a right guess
    if(text.toLowerCase().contains(char_input) && char_input!="" && char_input!=" " &&  char_input.length==1)
    {
      if(list_dashes.join("").toLowerCase().contains(char_input)) //to handle if the user inputs the same rightly guessed character again.
      {
        print("Character '$char_input' already entered!");
      }
      else{
        //fill the blanks with entered correct input.
        for(var i=0;i<list_dashes.length;i++)
        {
          if(text.toLowerCase()[i]==char_input){
            list_dashes[i]=text[i];}        
        }

        //check if the puzzle is complete
        if(list_dashes.join("")==text){
          win=true;
        }
      }
    }
    else
    {
      chance-=1;  //reduce a chance for wrong guess

      if((chance==3 || chance==2) && hint!="y"){   //making a hint feature available when chance is 3 and 2(if not already used hint)
        print("Chances left : $chance \nDo you want hint(info about the movie/book)?\nThis will cost you one chance!\nEnter [Y/N]:");
        hint=(stdin.readLineSync() as String).toLowerCase();  //Casting String? to String to prevent null exceptions
        if(hint=="y" || hint=="yes"){
          hint="y";   //even if user as entered "yes" , hint is assigned "y" value to simplify checking process.
          print("Hint : $hint_text");
          chance-=1;
        }
      }
    }
  }

  if(win){
    print("You Win!");
  }
  else{
    print("You lose, better luck next time!");
  }
  print("\nCorrect Answer : $text");
  print("-----------------------------------------\n");
}


void game_menu()     //game menu to choose difficulty and control the flow of game.
{
  var text;
  while(true)
  {
    print("-------------Game Menu-------------\nChoose difficulty level : \n  1-Easy\n  2-Medium\n  3-Hard\n\n  4-Back to Menu\nEnter your choice : ");
    var choice=stdin.readLineSync();

    while(choice==null ||  !["1","2","3","4"].contains(choice.trim())){  //if the user enters invalid input, keep asking for input till it's a valid one. 
      print("Entered invalid choice\nPlease try again.");
      choice=stdin.readLineSync();
    }
    if(choice=="4"){
      break;
    }

    text=get_text(int.parse(choice)); //get text w.r.t the difficulty level chosen by the user

    
    // print(text);   //key value pair(name and hint)
    var list=create_hangman(text.keys.first);   //passing on the key/text from the map which will return a list of dashes for the same.
    check_and_display(text.keys.first,text[text.keys.first],list);    //passing the key(main text),value(hint) and list of dashes

  }
}



void main()   //main menu 
{  
  while(true)
  {
    print("-------------Hangman Game - Guess the Movie!-------------\n  1-Game info\n  2-Play game\n  3-Exit\nEnter your choice : ");
    var choice=stdin.readLineSync();

    if(choice=="1"){
      print("""\n             Game info:\n->Hangman is a classic word game in which you must guess the secret word to win the game! 
->In this version you'll have to guess a movie name(bollywood or hollywood)

->The game will randomly select a movie title according to your difficulty level of choice, and you have upto 6 incorrect \n  letter guesses to save the stick man.

->You can also use hints provided to guess the letter(hints option will be shown to the player when he's got 3 or 2 chances \n  left to play, but play them smartly... using hint will reduce your chance by 1)\n""");
    }
    else if(choice=="2"){
      game_menu();
    }
    else if(choice=="3")
    {
      break;
    }
    else{
      print("Entered Invalid choice!\nPlease try again");
    }

  }
  // print("outside while");
}