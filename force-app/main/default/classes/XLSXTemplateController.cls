public class XLSXTemplateController {

    public String xmlHeader {get; set;}
    public List<String> textList {get; set;}

    public XLSXTemplateController() {
        xmlHeader = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>';
        String serializeTextList = ApexPages.currentPage().getParameters().get('textList');
        textList = (List<String>) System.JSON.deserialize(serializeTextList, List<String>.class);
    }

}
