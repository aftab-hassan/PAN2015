package extraction1; //delete this line if this file is not in the folder com.company

import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamConstants;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.events.StartElement;
import javax.xml.stream.events.XMLEvent;
import java.io.*;
import java.util.Scanner;
import extraction1.User;


public class Main {

    private User userObject;
    private static final String COMMA_DELIMITER = ",";
    private static final String NEW_LINE_SEPARATOR = "\n";
    private static final String FILE_HEADER = "userId,status,nTweets,age,gender,openS,consS,agrS,extS,neuS";
    //Name of the CSV file to be created

    //file path of the folder containing the xml files
    private String INPUT_PATH;
    private String OUTPUT_PATH;
    private int countTweets;

    public Main(String inputpath, String outputpath, String outputfile){
        this.INPUT_PATH = inputpath;
        this.OUTPUT_PATH = outputpath + "\\" + outputfile;
        //this.OUTPUT_PATH = "C:\\Users\\arroju15\\pansubmission\\FinalCode\\intermediatetrainoutput\\trainDataEnglish.csv";
    }


    public void getUserDetails(){
        File file = new File(OUTPUT_PATH);
        try {
            file.createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            FileWriter writer = new FileWriter(OUTPUT_PATH);
            writer.append(FILE_HEADER);
            writer.append(NEW_LINE_SEPARATOR);
            writer.flush();
            writer.close();

        } catch (IOException e) {
            e.printStackTrace();
        }



        try {
            String userId, tweetsText;
            userObject = new User();

            Scanner fileScanner = new Scanner(new File(INPUT_PATH + "/truth.txt"));

            while(fileScanner.hasNextLine()){
                String line = fileScanner.nextLine();
                //System.out.println(line);
                String[] attributes = line.split(":::");
                userId = attributes[0];
                tweetsText = xmlParse(userId);
                setUserAttributes(attributes, tweetsText);
                writeToCSV(userObject);
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    private void setUserAttributes(String[] attributes, String tweetsText){
        userObject.setUserId(attributes[0]);
        userObject.setGender(attributes[1]);
        userObject.setAge(attributes[2]);
        userObject.setExtS(Float.parseFloat(attributes[3]));
        userObject.setNeuS(Float.parseFloat(attributes[4]));
        userObject.setAgrS(Float.parseFloat(attributes[5]));
        userObject.setConsS(Float.parseFloat(attributes[6]));
        userObject.setOpenS(Float.parseFloat(attributes[7]));

        userObject.setNoOfTweets(countTweets);
        userObject.setTweetsText(tweetsText);
    }

    private void writeToCSV(User user){
        try {
            FileWriter csvWriter = new FileWriter(OUTPUT_PATH, true);

            csvWriter.append(user.getUserId());
            csvWriter.append(COMMA_DELIMITER);
            csvWriter.append(user.getTweetsText());
            csvWriter.append(COMMA_DELIMITER);
            csvWriter.append(Integer.toString(user.getNoOfTweets()));
            csvWriter.append(COMMA_DELIMITER);
            csvWriter.append(user.getAge());
            csvWriter.append(COMMA_DELIMITER);
            csvWriter.append(user.getGender());
            csvWriter.append(COMMA_DELIMITER);
            csvWriter.append(Float.toString(user.getOpenS()));
            csvWriter.append(COMMA_DELIMITER);
            csvWriter.append(Float.toString(user.getConsS()));
            csvWriter.append(COMMA_DELIMITER);
            csvWriter.append(Float.toString(user.getAgrS()));
            csvWriter.append(COMMA_DELIMITER);
            csvWriter.append(Float.toString(user.getExtS()));
            csvWriter.append(COMMA_DELIMITER);
            csvWriter.append(Float.toString(user.getNeuS()));
            csvWriter.append(NEW_LINE_SEPARATOR);

            csvWriter.flush();
            csvWriter.close();

        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    public String xmlParse(String userId){

        StringBuilder stringBuilder = new StringBuilder();
        String filename = INPUT_PATH + "/" + userId + ".xml";
        XMLInputFactory factory = XMLInputFactory.newInstance();
        countTweets = 0;

        try {

            XMLEventReader eventReader = factory.createXMLEventReader(new FileReader(filename));

            while (eventReader.hasNext()){
                XMLEvent event = eventReader.nextEvent();

                switch (event.getEventType()){

                    case XMLStreamConstants.START_ELEMENT:
                        StartElement startElement = event.asStartElement();
                        String qName = startElement.getName().getLocalPart();

                        if(qName.equalsIgnoreCase("document")){
                            event = eventReader.nextEvent();
                            String data = event.asCharacters().getData();
                            stringBuilder.append(" ");
                            stringBuilder.append(data);
                        }

                    case XMLStreamConstants.END_ELEMENT:
                        countTweets++;

                    case XMLStreamConstants.END_DOCUMENT:
                        break;
                }
            }

        } catch (XMLStreamException e) {
            e.printStackTrace();
        } catch (java.io.IOException e) {
            e.printStackTrace();
        }


        String text = stringBuilder.toString();
        //System.out.println(text);
        text = text.replaceAll(",", " ");
        text = text.replaceAll("\n", " ");
        return text;
    }

    public static void main(String[] args) {

        // String text = "Hello world";

        // System.out.println(args[0]);
        // System.out.println(args[1]);
        // System.out.println(args[2]);

        // try {
        //     File file = new File("C:\\Users\\arroju15\\pansubmission\\FinalCode\\intermediatetrainoutput\\example.txt");
        //     BufferedWriter output = new BufferedWriter(new FileWriter(file));
        //     output.write(text);
        //     output.close();
        // } catch ( IOException e ) {
        //     e.printStackTrace();
        // }

        Main test = new Main(args[0], args[1], args[2]);
        test.getUserDetails();
    }

}
