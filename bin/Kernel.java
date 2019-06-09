package bin;

import interfaces.Communication;

import protocols.KerC;
import protocols.BindC;

public class Kernel implements Communication<String,KerC,BindC>{
  @Override
  public void post(String info, KerC code, Communication<String,BindC,KerC> channel){
    
  }
  public static Kernel init(){return new Kernel();}
}
