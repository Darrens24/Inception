# Inception
Project about dockers

* mount can be used to modify configuration files without rebuilding the image. I won't use it in this project, but it's a useful feature.
    -> docker run -v /path/to/key.pem:/path/to/key.pem -v /path/to/cert.pem:/path/to/cert.pem image:tag

* in the Nginx conf, you can specify \ .php$ which means that the dot is not a wildcard (like in bash) and that the string MUST be TERMINATED by .php

* CGI(Common Gateway Interface) allows a Nginx server to communicate with scripts of execution or apps(like PHP)
* FPM (FastCGI Process Manager) 
