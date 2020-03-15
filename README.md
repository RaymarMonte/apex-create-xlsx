This project serves both as a guide and an example on how to create Excel .xlsx files using the Apex Programming Language of Salesforce. This is useful for generating custom reports that are beyond the capabilities of Salesforce Report.

Below is a detailed guide on how to accomplish this:
1. Create and design an example of how your document will actually look like in Microsoft Excel complete with data and everything else.
2. (Optional) Remove hidden metadata and personal information from the document using Excel's built-in Inspect Document.
3. Save the document as an Excel Workbook type. The file created should have a .xlsx file type.
4. Extract the contents of the created file using your favorite file archiving program like 7-Zip.
5. Format all XML files extracted from the excel document for easier reading.
6. Set-aside the sheet file(s) from xl\worksheets\ folder of the extracted files/folders.
7. With the sheet file(s) removed, re-archive the extracted files/folders into a ZIP file.
8. Upload the ZIP file as a Static Resource in your Salesforce instance. This should end up like [XLSXTemplateFrame](force-app\main\default\staticresources\XLSXTemplateFrame).
9. To be continued...


Development-Related Notes:
- The example given here is very simple. Further research on Office Open XML and some trial and error need to be done to do some of the more complex features of Excel like formatting, styling, formulas, and such.
- When creating and editing the excel file template on Microsoft Excel, I suggest having a standard zoom level upon saving the document since this may affect the generated size values of rows and cols on the sheet file.
- Development-wise, I suggest not using shared strings on the XLSX and just directly putting strings on the template as to have an easier time focusing on just the template. You can take this a step further and complete delete the sharedStrings.xml and all references to it on the other files on the Template Frame.

Special thanks to Pedro Dal Col and Pliny Smith for Zippex. Zippex is a set of Apex classes that enables operation on zip files on Apex. Check it out at: https://github.com/pdalcol/Zippex