echo off

rem Create self signed server certificate
keytool -genkeypair -alias server -keyalg RSA -keysize 2048 -storetype PKCS12 -keystore server.p12 -validity 3650 -ext SAN=dns:localhost,ip:127.0.0.1 -dname "CN=localhost" -storepass changeit

rem create public cert from self signed server certificate
keytool -export -alias server -file server.crt -keystore server.p12 -storepass changeit

rem create self signed client certificate
keytool -genkeypair -alias client -keyalg RSA -keysize 2048 -storetype PKCS12 -keystore client.p12 -validity 3650 -ext SAN=dns:localhost,ip:127.0.0.1 -dname "CN=localhost" -storepass changeit

rem create public cert from the self signed client certificate
keytool -export -alias client -file client.crt -keystore client.p12 -storepass changeit

rem import client's cert into server's keystore 
keytool -import -alias client -file client.crt -keystore server.p12 -storepass changeit -noprompt

rem Convert the servers certificate to DER format so it can be used with curl
openssl x509 -inform DER -outform PEM -in server.crt -out server.pem
