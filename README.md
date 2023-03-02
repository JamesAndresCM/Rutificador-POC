# README

* Rutificador Chilean API POC

* Decompress [file](http://www.mediafire.com/file/l8kyol8ltl82dg2/PadronElectoralChile2020.tar.gz/file) in lib/tasks folder

* Run task to insert records in Database
```
bundle exec rake read_records:file[PATH_DECOMPRESS_FILE]
```

* 2 Endpoints

* Search by rut
```
http://localhost:3000/api/v1/search?rut=11XXXXXX
```

* Search by first-name,paternal,maternal
```
http://localhost:3000/api/v1/search?first_name=first_name&paternal=paternal&maternal=maternal
```






