Williams’ faculty data was collected from two different sources – from the Williams website and manually entered from hard copies of course catalogs. Furthermore, the catalog archive on the website provides data in two different formats. From academic years 2001-2010, the data is stored in pdf files, whereas from 1998-2000 the data is only available in html format online.

To facilitate the data read-in process in R, the files downloaded from the archive are converted to txt files and scrubbed. The following describes the necessary steps to convert the data from its raw form into the txt files that the Williams package processes. 

Raw Data Source:

http://www.williams.edu/Registrar/catalog/archive.html

2009-2010 - http://www.williams.edu/Registrar/catalog/catalog0910.pdf
2008-2009 - http://www.williams.edu/Registrar/catalog/catalog0809.pdf
2007-2008 - http://www.williams.edu/Registrar/catalog/catalog0708.pdf
2006-2007 - http://www.williams.edu/Registrar/catalog/catalog0607.pdf
2005-2006 - http://www.williams.edu/Registrar/catalog/catalog0506.pdf
2004-2005 - http://www.williams.edu/Registrar/catalog/depts0405/catalog0405.pdf
2003-2004 - http://www.williams.edu/Registrar/catalog/depts0304/catalog.pdf
2002-2003 - http://www.williams.edu/Registrar/catalog/depts0203/catalog.pdf
2001-2002 - http://www.williams.edu/Registrar/catalog/depts0102/catalog.pdf
2000-2001 - http://www.williams.edu/Registrar/catalog/depts0001/catalog.pdf

Data Scrub for PDF files:
1. Download PDF text extractor (http://www.a-pdf.com/text/index.htm) and extract text from raw data files into .txt files.
2. Create a subset of the .txt file to only include faculty information by deleting all other text.

1999-2000 – http://www.williams.edu/Registrar/catalog/deptlist9900.html
1998-1999 – http://www.williams.edu/Registrar/catalog/deptlist9899.html
1997-1998 – http://www.williams.edu/Registrar/catalog/deptlist9798.html

Data Scrub for HTML files:
1. Download and install WinHTTrack Website Copier (http://www.httrack.com/).
2. Name the project and select a destination path, then click next.
3. Copy and paste the appropriate URL into the text box.
4. In the Set Options menu, in the Limits tab, set the maximum mirroring depth to 2. In the Experts Only tab, set the Global travel mode to Stay on the same domain.
5. Click Finish
6.  Download and install TXTcollector (http://bluefive.pair.com/txtcollector.htm).
7. Browse the folders and select the destination path for the previously downloaded html data.
8. Select htm as the data type from the dropdown menu and check the Include subfolders, and No Separator boxes.
9. Click on 2. Combine all files and save the new combined txt file.
