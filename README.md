# Static-Site

Static-Site is a basic docker image that will download a static site from a git repository and host it. It is dependent on the [nginx image](https://hub.docker.com/_/nginx/). This image does not handle authentication at the moment and requires that the site be statically built in the git repo under a branch. 

## Usage

To use this container, you should populate the following environment variables.

**GIT_URL**: The `http://github.com/username/repo.git` URL to the git repository
**GIT_BRANCH**: The branch in the git repo that contains the staticly built html files. (OPTIONAL)

To deloy a container with this image the following command can be used. 

~~~
docker run -d -p 8080:80 -e "GIT_URL=https://github.com/username/repo.git" -e "GIT_BRANCH=master" jarretlavallee/static-site
~~~

## License 
This is licensed under [WTFPL](http://www.wtfpl.net/) license. 
