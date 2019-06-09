package bin;

/*interfaces imports*/
import interfaces.Communication;

/*protocols imports*/
import protocols.KerC;
import protocols.BindC;

/*java imports*/
import java.util.Scanner;
import java.io.File;

public class Cli implements Communication<String,BindC,KerC>{
  private Communication<String,KerC,BindC> kernel;
  @Override
  public void post(String info, BindC code, Communication<String,KerC,BindC> channel){

  }
  /**
	*se encarga de leer archivos de la carpeta Information
	*y desplegarla en pantalla.
	*/
	private void displayInfo(String path){
    Scanner info;
		try{
			File file = new File("Information/".concat(path));
			if(file.exists()&&file.canRead()){
				info = new Scanner(file);
				while(info.hasNextLine()) System.out.println(info.nextLine());
        info.close();
			}
		}catch(Exception e){
      System.out.println(String.format("Algo Salió mal leyendo %s", path));
    }
	}

  private void init(){
    String line, command, argument;
    Scanner reader = new Scanner(System.in);
    while(true){
      System.out.print("console> ");/*PARA QUE SE VEA BONITO*/
      line = reader.nextLine();
      command = line.replaceAll(" .*", "").toLowerCase();
      argument = line.replaceFirst("[^ ]* ", "");

      if(command.equals("exit")) break;

      switch(command){

        case "help":
        displayInfo("instrucciones");
        System.out.println();
        break;

        default:
        System.out.println(String.format("  %s", "EL COMANDO NO SE RECONOCE"));
        break;
      }
    }
    reader.close();
  }
  private Cli(Communication<String,KerC,BindC> kernel){
    this.kernel = kernel;
    this.init();
  }
  public static Cli initAndSetKernel(Communication<String,KerC,BindC> kernel){return new Cli(kernel);}
}
