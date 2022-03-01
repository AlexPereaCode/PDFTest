# Interview Alejandro Perea: iOS/Swift exercise (Requirements)

The goal of this exercise is to analyze the candidate's:
- Organization of code and skills in Swift 5
- Knowlege of connection with an API Rest
- Implementation with 3rd party libraries


Do a small iOS App in Swift that allows: 
To compress a PDF using the API Rest of https://developer.ilovepdf.com/docs/api-reference (Create a free developer account)
- The PDF is not needed to be selected by the user, it can be done only by clicking a button 'Compress'
- Download the output PDF file and open it with a PDF library of your choice (for instance: PDFKit https://developer.apple.com/documentation/pdfkit)
- Push source code in this repository, no need to create different branches
- Edit this README or create a new one with instructions on how to install the App 

Extra points:
- Let the user choose the file to compress from the files in the device
- Let the user choose the level of compression before sendind the PDF to compress to the API Rest

Notes:
- Ask us any doubt regarding the API
- After the interview, none of the code will be used by ILOVEPDF and will be destroyed if the candidate is not hired.

----------------------------------------------------------------------------------------------------------------------


[![Swift 5](https://img.shields.io/badge/Swift-5.5-orange.svg?style=flat)](https://swift.org)
## Architecture

- MVP pattern with use cases and dependency injection.

## Features

- Network Layer
- Custom Views
- Base Classes

It contains 5 use cases to process the compression of the PDF with the server and show it compressed in a detail view:
- Get Token
- Start Task
- Upload
- Process
- Download

## Third-party libraries

- Alamofire 

## Instructions:

First you have to add the PDF example files in the simulator or device.

1 - Open files app:

<img src="https://github.com/AlexPereaCode/PDFTest/blob/master/Screenshots/1.png" width="250">

2 - Select internal storage:

<img src="https://github.com/AlexPereaCode/PDFTest/blob/master/Screenshots/2.png" width="250">

3 - Drag and drop sample PDFs: (Examples included in the repository)

<img src="https://github.com/AlexPereaCode/PDFTest/blob/master/Screenshots/3.png" width="250">

4 - Saved files in local:

<img src="https://github.com/AlexPereaCode/PDFTest/blob/master/Screenshots/4.png" width="250"> <img src="https://github.com/AlexPereaCode/PDFTest/blob/master/Screenshots/5.png" width="250">

# Compression Process In App

1 - Select local PDF example to compress:

<img src="https://github.com/AlexPereaCode/PDFTest/blob/master/Screenshots/6.png" width="250">

2 - Select the compression level and at the end of the process:

<img src="https://github.com/AlexPereaCode/PDFTest/blob/master/Screenshots/7.png" width="250">

3 - The compressed PDF will be displayed on a new screen:

<img src="https://github.com/AlexPereaCode/PDFTest/blob/master/Screenshots/8.png" width="250">

# Notes

- To use other public keys, go to the path PDFTest/Credentials/Credentials.plist, modify the public_key field.

- Enjoy :)

