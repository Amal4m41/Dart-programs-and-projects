import 'dart:io';

Map get_text(){

  var d1={"Sherlock Holmes":"....a brilliant but eccentric private detective. Together they solve baffling, and often bizarre, murder mysteries. They also have to compete with Holmes nemesis, the criminal genius Moriarty.","Shutter island":"Teddy Daniels and Chuck Aule, two US marshals, are sent to an asylum on a remote island in order to investigate the disappearance of a patient, where Teddy uncovers a shocking truth about the place.","Angels and Demons":"Robert, a symbologist, tries his best to stop a secret society from destroying Vatican City. He tries to decipher various clues in the process, most of which lead him to the four altars of science.","The Da vinci code":"Symbologist Robert Langdon travels from Paris to London to discover the truth behind a mysterious and bizarre murder. Later, he learns about a religious mystery protected by a secret society.","Zindagi na milegi dobara":"Friends Kabir, Imran and Arjun take a vacation in Spain before Kabir's marriage. The trip turns into an opportunity to mend fences, heal wounds, fall in love with life and combat their worst fears."};

  var d2={"Jack and the giant slayer":'Jack, a young farmhand, must save Princess Isabelle from the giants after one of the magic beans that a monk gives him in exchange of his horse sprouts a giant beanstalk into the realm of the giants.',"Inferno":'After waking up with amnesia in a hospital, Robert Langdon teams up with Sienna Brooks, one of his doctors, to protect the world from the evil plan of a mad scientist.',"The lost symbol":"......is best-selling author Dan Brown's third thriller novel following the life of symbologist Robert Langdon as he works to solve the mystery behind the disappearance of his mentor, Peter Solomon, whose severed hand is found in the Capitol Building in Washington DC during a Smithsonian fundraiser.","Super 30":'..... a mathematician from Patna, India, works his way through challenges towards success before running a programme for IIT aspirants in Patna.',"Avengers Endgame":'After an intergalactic warlord, disintegrates half of the universe, a team must reunite and assemble again to reinvigorate their trounced allies and restore balance.'};

  var d3={"Anaconda chapter 2":'A large corporation sponsors a team of biologists to travel deep into the Amazon rainforest and retrieve a flower known as blood orchid, which could hold the key to everlasting youth.',"Once upon a time in Hollywood":"Actor Rick Dalton gained fame and fortune by starring in a 1950s television Western, but is now struggling to find meaningful work in a Hollywood that he doesn't recognize anymore","War":'',"Jurrasic World":'A theme park showcasing genetically-engineered dinosaurs turns into a nightmare for its tourists when one of the dinosaurs escapes its enclosure.',"Andhadhuns":'A piano player pretending to be visually-impaired, unwittingly becomes entangled in a number of problems as he witnesses the murder of a former film actor.'};

  for(var i in d1.keys){
    print(d1[i]);
  }
  return {"yes":"d"};
}

void random()
{
  
}


void main()
{
  // var i=0;
  var s="Anaconda";
  var l=s.split('');
  // for(int i=0;i<l.length;i++)
  // {
  //   if(s.toLowerCase()[i]=="a"){
  //     l[i]="_";
  //   }
  // }
  // print(s.length);
  // print(l.length);
  // print(l);
  // print(l.contains("a"));
  print("sf s".contains("  "));
}
