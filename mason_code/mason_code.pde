int dealer;
int player;
int faceDown;
Button hit;
Button stay;
boolean bust = false;
boolean isTurn = true;
boolean playerWin = false;
boolean dealerWin = false;
boolean noWIn = false;
ArrayList<card> playersHand = new ArrayList<card>();
ArrayList<card> dealersHand = new ArrayList<card>();
ArrayList<card> cards = new ArrayList<card>();
card faceDownCard;
void setup()
{
  cards.add(new card(1,loadImage("ace.png")));
  cards.add(new card(1,loadImage("ace.png")));
  cards.add(new card(1,loadImage("ace.png")));
  cards.add(new card(1,loadImage("ace.png")));
  cards.add(new card(2,loadImage("2.png")));
  cards.add(new card(2,loadImage("2.png")));
  cards.add(new card(2,loadImage("2.png")));
  cards.add(new card(2,loadImage("2.png")));
  cards.add(new card(3,loadImage("3.png")));
  cards.add(new card(3,loadImage("3.png")));
  cards.add(new card(3,loadImage("3.png")));
  cards.add(new card(3,loadImage("3.png")));
  cards.add(new card(4,loadImage("4.png")));
  cards.add(new card(4,loadImage("4.png")));
  cards.add(new card(4,loadImage("4.png")));
  cards.add(new card(4,loadImage("4.png")));
  cards.add(new card(5,loadImage("5.png")));
  cards.add(new card(5,loadImage("5.png")));
  cards.add(new card(5,loadImage("5.png")));
  cards.add(new card(5,loadImage("5.png")));
  cards.add(new card(6,loadImage("6.png")));
  cards.add(new card(6,loadImage("6.png")));
  cards.add(new card(6,loadImage("6.png")));
  cards.add(new card(6,loadImage("6.png")));
  cards.add(new card(7,loadImage("7.png")));
  cards.add(new card(7,loadImage("7.png")));
  cards.add(new card(7,loadImage("7.png")));
  cards.add(new card(7,loadImage("7.png")));
  cards.add(new card(8,loadImage("8.png")));
  cards.add(new card(8,loadImage("8.png")));
  cards.add(new card(8,loadImage("8.png")));
  cards.add(new card(8,loadImage("8.png")));
  cards.add(new card(9,loadImage("9.png")));
  cards.add(new card(9,loadImage("9.png")));
  cards.add(new card(9,loadImage("9.png")));
  cards.add(new card(9,loadImage("9.png")));
  cards.add(new card(10,loadImage("10.png")));
  cards.add(new card(10,loadImage("10.png")));
  cards.add(new card(10,loadImage("10.png")));
  cards.add(new card(10,loadImage("10.png")));
  cards.add(new card(10,loadImage("jack.png")));
  cards.add(new card(10,loadImage("jack.png")));
  cards.add(new card(10,loadImage("jack.png")));
  cards.add(new card(10,loadImage("jack.png")));
  cards.add(new card(10,loadImage("queen.png")));
  cards.add(new card(10,loadImage("queen.png")));
  cards.add(new card(10,loadImage("queen.png")));
  cards.add(new card(10,loadImage("queen.png")));
  cards.add(new card(10,loadImage("king.jpg")));
  cards.add(new card(10,loadImage("king.jpg")));
  cards.add(new card(10,loadImage("king.jpg")));
  cards.add(new card(10,loadImage("king.jpg")));
  size(1920, 1080);
  hit = new Button(50,50, "Hit");
  stay = new Button(300,50, "Stay");
  deal();
}
void draw()
{
  background(150);
  paintPlayer();
  paintDealer();
  hit.draw();
  stay.draw();
  text("Player: "+player, 10,150);
  text("Dealer: "+dealer, 100,150);
  if(playerWin==true)
  text("Player Wins!",200,150);
  else if(dealerWin==true)
  text("Dealer Wins!",200,150);
  else if(noWIn==true)
  text("Its a draw!",200,150);

}
void deal()
{
      int draw;
      draw = floor(random(cards.size()));
      player+=cards.get(draw).value;
      playersHand.add(cards.get(draw));
      cards.remove(draw);
      draw = floor(random(cards.size()));
      faceDown=cards.get(draw).value;
      faceDownCard = cards.get(draw);
      cards.remove(draw);
      draw = floor(random(cards.size()));
      player+=cards.get(draw).value;
      playersHand.add(cards.get(draw));
      cards.remove(draw);
      draw = floor(random(cards.size()));
      dealer+=cards.get(draw).value;
      dealersHand.add(cards.get(draw));
      cards.remove(draw);
      if(player>21)
      bust = true;
      print("\nPlayers hand: "+player);
}
void mousePressed()
{
  int draw;
  if(hit.over()&&isTurn == true&&bust==false)
  {
    draw = floor(random(cards.size()));
    player+=cards.get(draw).value;
    playersHand.add(cards.get(draw));
    cards.remove(draw);
    print("\nPlayers hand: "+player);
    if(player>21)
    {
      bust = true;
      play();
    }
  }
  else if(stay.over())
      {
        print("\nYou stay!");
        isTurn = false;
        play();
      }
}
void play()
{
  if(player==21)
  playerWin = true;
  int draw;
  if(isTurn == false&&bust == false)
  {
    dealer+=faceDown;
    dealersHand.add(faceDownCard);
    print("\nDealers hand: "+dealer);
    while(dealer<17)
    {
      draw = floor(random(cards.size()));
      dealer+=cards.get(draw).value;
      dealersHand.add(cards.get(draw));
      print("\nDealer draws: "+cards.get(draw).value);
      cards.remove(draw);
      print("\nDealers hand: "+dealer);
    }
    if(dealer>player&&dealer<=21)
    {
    print("\nDealer Wins!");
    dealerWin = true;
    }
    else if(player==dealer)
    {
    print("\nDraw!");
    noWIn = true;
    }
    else
    {
    print("\nPlayer Wins!");
    playerWin = true;
    }
  }
  if(bust == true)
  dealerWin = true;
  print("\nDealer Wins!");
}
void paintPlayer()
{
  for(int i =0; i<playersHand.size(); i++)
  {
    image(playersHand.get(i).image, 100+i*100,400);
  }
}
void paintDealer()
{
  for(int i =0; i<dealersHand.size(); i++)
  {
    image(dealersHand.get(i).image, 900+i*100,400);
  }
}