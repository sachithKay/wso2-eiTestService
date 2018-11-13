import ballerina/io;

public function main(string... args) {
    testXML();
}


function testXML() {

  xml sample = xml `<shiporder orderid="889923"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="shiporder.xsd">
  <orderperson>John Smith</orderperson>
  <shipto>
    <name>Ola Nordmann</name>
    <address>Langgt 23</address>
    <city>4000 Stavanger</city>
    <country>Norway</country>
  </shipto>
  <item>
    <title>Empire Burlesque</title>
    <note>Special Edition</note>
    <quantity>1</quantity>
    <price>10.90</price>
  </item>
  <item>
    <title>Hide your heart</title>
    <quantity>1</quantity>
    <price>9.90</price>
  </item>
</shiporder>`;


  string a = "abcbcd";
  string b = "abcbcd";

  // string newlineSample = "hello,myname,is,sachith.\nim23,years,old.\ni,like,ice,cream.\nim,bired";
  //// io:println(newlineSample);
  //
  // string[] lines = newlineSample.split("\n");
  //
  // foreach line in lines  {
  //     io:println(line);
  // }

string messageId = "1_4_1_3";
  string presetFilePath = "./Resource/csv/request/" + messageId + ".csv";
  io:CSVChannel csvChannel = io:openCsvFile(presetFilePath);

  while (csvChannel.hasNext()) {
    match csvChannel.getNext() {
      string[] presetRecord => {

        io: println(presetRecord);
        //io:println(requestRecord);
        io:println("");


      }
      () => {
        error e = { message: "Record channel not initialized properly" };
        throw e;
      }
      error err => {
        throw err;
      }
    }
  }



}


