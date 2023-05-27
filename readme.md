# Setting up security
The server uses mutual authentication where client can verify Security Manager's identity and the server only allows verified clients 
to connect to it. Verification is done using SSL certificates. 

# Running the server
Both server and client certificates are created using the gencerts.bat batch file. After building and packaging the code sample,
created a folder named "sec" at the same level of the fat JAR. Copy the gencerts.bat file in the "sec" folder and execute it. 
```
> gencerts.bat
```
Next navigate back to the folder containing the fat jar and run it:
```
java -jar server-0.0.1-SNAPSHOT.jar
```

# Calling the server using curl
Navigate inside the "sec" folder and execute:
```
curl https://localhost:8080/health/ --cert client.p12:changeit --cacert server.pem
```

References:
https://www.aurigait.com/blog/how-to-implement-2-way-ssl-using-spring-boot/
https://stackoverflow.com/questions/991758/how-to-get-pem-file-from-key-and-crt-files
