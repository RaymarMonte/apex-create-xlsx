This project serves both as a guide and an example on how to create Excel .xlsx files using the Apex Programming Language of Salesforce. This is useful for generating custom reports that are beyond the capabilities of Salesforce Report. The general idea of how this is done is to create a .xlsx file using Microsoft Excel complete with sample data and styling, open up the file using a file archiving software to retrieve the XML files that composes it, put all those files to salesforce, and use Apex to recompose the .xlsx file while editings its content to plug-in actual data.

Below is a detailed guide on how to accomplish this:
1. Create and design an example of how your document will actually look like in Microsoft Excel complete with data and everything else.
2. (Optional) Remove hidden metadata and personal information from the document using Excel's built-in Inspect Document.
3. Save the document as an Excel Workbook type. The file created should have a .xlsx file type.
4. Extract the contents of the created file using your favorite file archiving program like 7-Zip.
5. Format all XML files extracted from the excel document for easier reading.
6. Set-aside the sheet file from xl\worksheets\ folder of the extracted files/folders.
7. With the sheet file removed, re-archive the extracted files/folders into a ZIP file.
8. Upload the ZIP file as a Static Resource in your Salesforce instance. This should end up like [XLSXTemplateFrame](force-app/main/default/staticresources/XLSXTemplateFrame).
9. Add the Zippex classes to your project. You can get it from https://github.com/pdalcol/Zippex.
10. Create the template controller apex class (see [XLSXTemplateControleler.cls](force-app/main/default/classes/XLSXTemplateController.cls)), the template visualforce page (see [XLSXTemplate.page](force-app/main/default/pages/XLSXTemplate.page)), and the generator apex class (see [XLSXGenerator.cls](force-app/main/default/classes/XLSXGenerator.cls)).
    1. The xmlHeader variable in template controller is needed since this is the only way to add the xml header tag to be added to the template without causing an error on salesforce side.
    2. Copy the content of the earlier sheet file that have been removed starting from the worksheet tag all the way to the bottom.
    3. Take note of how a given data from the generator class is propagated towards the template.

That's about it! If you have any questions, feel free to create an issue on this repo and I'll get back to you.

Development-Related Notes:
- The example given here is very simple. Further research on Office Open XML and some trial and error need to be done to do some of the more complex features of Excel like formatting, styling, formulas, and such.
- When creating and editing the excel file template on Microsoft Excel, I suggest having a standard zoom level upon saving the document since this may affect the generated size values of rows and cols on the sheet file.
- Development-wise, I suggest not using shared strings on the XLSX and just directly putting strings on the template as to have an easier time focusing on just the template. You can take this a step further and completely delete sharedStrings.xml and all references to it on the other files on the Template Frame.

Special thanks to Pedro Dal Col and Pliny Smith for Zippex. Zippex is a set of Apex classes that enables operation on zip files on Apex. Check it out at: https://github.com/pdalcol/Zippex