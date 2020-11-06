void loadGif(){
  //function to load gif
      image(gif[f],0,0,width,height);
   f++;
   if(f==numPages){f = 0;}
}
