public class XLSXGenerator {
    
    public static String generate(List<String> textList) {
        // Build XLSX File Content
        PageReference xlsxTemplate = page.XLSXTemplate;
        xlsxTemplate.getParameters().put('textList', System.JSON.serialize(textList));
        Blob xlsxContent;
        if (Test.isRunningtest()) {
            xlsxContent = Blob.valueOf('Sample');
        } else {
            xlsxContent = xlsxTemplate.getContent();
        }
        // Build XLSX File Frame
        StaticResource xlsxTemplateFrame = [SELECT Body FROM StaticResource WHERE Name = 'XLSXTemplateFrame' LIMIT 1];
        Zippex xlsx = new Zippex(xlsxTemplateFrame.Body);
        // Add the Content to the Frame to complete the File
        xlsx.addFile('xl/worksheets/sheet1.xml', xlsxContent, null);
        // Save XLSX File 
        ContentVersion cv = new ContentVersion();
        String title = 'XLSXExample';
        cv.Title = title;
        cv.PathOnClient = title + ' - ' + DateTime.now() + '.xlsx';
        cv.VersionData = xlsx.getZipArchive();
        insert cv;
        Id contentDocumentid = [SELECT Id FROM ContentDocument WHERE LatestPublishedVersionId = :cv.Id].Id;
        return URL.getOrgDomainUrl().toExternalForm() + '/sfc/servlet.shepherd/document/download/' + contentDocumentid;
    }

}
