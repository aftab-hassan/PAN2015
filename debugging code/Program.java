import java.io.*;
import java.util.Scanner;

public class Program {
    public static void main(String[] args) {
        String text = "Hello world";
        try {
            File file = new File("C:\\Users\\arroju15\\pansubmission\\FinalCode\\intermediatetrainoutput\\example.txt");
            BufferedWriter output = new BufferedWriter(new FileWriter(file));
            output.write(text);
            output.close();
        } catch ( IOException e ) {
            e.printStackTrace();
        }
    }
}