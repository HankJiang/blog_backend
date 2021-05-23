# Blog后台(v0.0.1)

### dependencies

 - ruby 2.6.5
 - rails 6.0
 - postgres
 
### deploy

```bash
    > docker build .
    > docker run -d  -p 3000:3000 -e PG_HOST='host.docker.internal' image
```
