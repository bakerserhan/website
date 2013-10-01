Website
=========
<i>It's a static website and it can be deployed via git.</i>

##What is this?

  - Just a static website
  - Ok, it's actually a very simple Rack app 
  - In order to deploy a static website to Heroku, I used Rack

##How to Install?
Check out installer.sh. That should give you a hint. You have to have ruby and you should be able to install ruby gems.
Then you can even install only from that script! 
<i>(you might want to run `ps auxwww | grep ruby` and kill the server process afer script run.)</i>

###What's inside?
Those:

```sh
.
├── Gemfile
├── Gemfile.lock
├── config.ru
├── public
│   ├── css
│   │   └── sample.css
│   ├── images
│   │   └── sample.png
│   ├── index.html
│   └── js
│       └── sample.js
```
