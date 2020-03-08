# openemr-501-custom

**Note:** This README is not organized in optimized manner. This is a work in progress.

* This repository contains customized code of openemr 5.0.1 . This is not an "installer". The files are supposed to be copied in a documentroot of a web server. 
* The `Dockerfile` is a cut-down version of what openemr suggests. I have not included perl, git, pip, python, etc.
* The `docker-compose.yml` file starts `mysql` and `openemr` services.
* Check the `mysql.env.example`  and `openemr.env.example` files to see which environment variables to configure. Copy the `mysql.env.example` file to `mysql.env` file, and `openemr.env.example` to `openemr.env` . 
* The ENV files without the `.example` prefix are git-ignored for safety and security reasons.
* The database dump of a pre-created database needs to be setup in MySQL. One way to do this is to pass a `.sql` file at mysql container start time. Check the `docker-compose.yml` file to see how it is done.





