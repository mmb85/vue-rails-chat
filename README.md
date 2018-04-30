# vue-rails-chat
# Rails Backend:
To launch backend on rails it will be necesary to install:
ruby 2.5.1
Rails Rails 5.1.6

Use rbenv or rvm to install both:

`https://github.com/rbenv/rbenv#readme`

`https://rvm.io/rvm/install`

After install ruby & rails execute the command below:

Execute `bundle install` to install all gem and dependencies.

Execute `rails db:create` to create mongoDB

Launch on a separate terminal the server using `rails server` (It will be launched on port `3000`)


# VUe Frontend
To launch Frontend side it will be necesary nodejs that can be installed using npm or other methods like described below.

Install Node

Install Node and NPM (Using PPA to get latest version)

Get the setup script:

```$ cd ~
$ curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
```
Inspect that you have the script, then run with sudo:
```
$ vim nodesource_setup.sh
$ sudo bash nodesource_setup.sh
```
Now install Nodejs:

```
$ sudo apt-get install nodejs
```
The nodejs package contains the nodejs binary as well as npm, so you don't need to install npm separately. However, in order for some npm packages to work (such as those that require compiling code from source), you will need to install the build-essential package:

```$ sudo apt-get install build-essential```

Install Vue-CLI

Change directory to the directory where you want this example project to reside:

an example folder will be created here on the next step...
```$ cd ~```
Install Vue-cli with webpack:

```$ sudo npm install -g vue-cli```
```$ vue init webpack chatroom_frontend```

(Note: If you've already installed the cli before and when you init a new project you get the message: A newer version of vue-cli is available, then ctrl+c at the prompt and then: sudo npm install vue-cli -g to update (re-install) vue-cli to the latest version.)

vue-cli Generated "chatroom_frontend"
Install dependencies in package.json:

```$ cd chatroom_frontend ```
```$ npm install  # do this first before you add more dependencies (to avoid peer warns)```

After install all project dependencies launch the project with:
```npm run dev``` on a new terminal. This will run vue on port `8080`
