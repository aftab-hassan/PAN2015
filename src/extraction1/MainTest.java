package extraction1;

import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamConstants;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.events.StartElement;
import javax.xml.stream.events.XMLEvent;
import java.io.*;


public class MainTest {

    private User userObject;
    private static final String COMMA_DELIMITER = ",";
    private static final String NEW_LINE_SEPARATOR = "\n";
    private static final String FILE_HEADER = "userId,status,nTweets";
    //Name of the CSV file to be created

    //file path of the folder containing the xml files
    private String INPUT_PATH;
    private String OUTPUT_PATH;
    private int countTweets;

    public MainTest(String inputpath, String outputpath, String outputfile){
        this.INPUT_PATH = inputpath;
        this.OUTPUT_PATH = outputpath + "/" + outputfile;
    }


    public void getUserDetails() {
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


        String userId, tweetsText;
        userObject = new User();

        File[] files = new File(INPUT_PATH).listFiles();

        for(File aFile : files) {
            if(aFile.isFile()) {
                userId = aFile.getName();
                tweetsText = xmlParse(userId);
                setUserAttributes(userId, tweetsText);
                writeToCSV(userObject);
            }
        }

    }


    private void setUserAttributes(String userId, String tweetsText){
        userId = userId.replace(".xml", "");
        userObject.setUserId(userId);

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
            csvWriter.append(NEW_LINE_SEPARATOR);

            csvWriter.flush();
            csvWriter.close();

        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    public String xmlParse(String userId){

        StringBuilder stringBuilder = new StringBuilder();
        String filename = INPUT_PATH + "/" + userId;
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
        } catch (IOException e) {
            e.printStackTrace();
        }

        String text = stringBuilder.toString();
        text = text.replaceAll(",", " ");
        text = text.replaceAll("\n", " ");
        return text;
    }

    public static void main(String[] args) {
        MainTest test = new MainTest(args[0], args[1], args[2]);
        test.getUserDetails();
    }

}
