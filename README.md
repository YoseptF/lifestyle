# ![lifestile](https://i.imgur.com/ktFvh1l.png)

Lifestyle is a ruby-powered blog template, where you can publish articles and vote for them.

![FEATURE](https://i.imgur.com/2G4mvWc.png)

---
## How to run locally

### If you are a reviewer and for some reason can't get a [gamespot api](https://www.gamespot.com/api/), you can contact me on slack to get mine 😉

0. Before attempting this process, you'll need:
   - `ruby 2.7.0`
   - `rails 6` 
   - an API from [gamespot](https://www.gamespot.com/api/), if you want to load the seed (It is free, and you don't even need to _*register*_, you can just login with google, and grab the key)

1. Clone this repository
    ```
    $ git clone git@github.com:YoseptF/lifestyle.git
    ```
2. cd into the directory (you may need to checkout to other branch depending on what you are attempting to do)
    ```
    $ cd lifestyle/
    ```
3. bundle
    ```
    $ bundle install
    ```
4. yarn install
    ```
    $ yarn install --check-files
    ```
5. Migrate and seed (if you don't need the seed you can skip that one)
    
    5.1 if you want to seed you need to add your [gamespot api](https://www.gamespot.com/api/) in a file `.env` like this:
    ```
    GAMESPOT_API=your_api_key
    ```
    5.2 migrate and seed
    ```
    $ rails db:migrate db:seed
    ```
6. Open you browser on `localhost:3000 or 127.0.0.1:3000`

7. (optional) This project uses Azure for active storage on production, if you want to use it, you need to add the following api keys in your `.env` file:
    ```
    AZURE_STORAGE_ACCOUNT_NAME=your_storage_account
    AZURE_STORAGE_ACCESS_KEY=your_access_key
    AZURE_STORAGE_CONTAINER=your_storage_container
    ```
    or you can change from `:azure` to `:local` in the `production.rb`
---

# Live demo
 There's a [live demo](https://aqueous-springs-55430.herokuapp.com/) if you wanna check it out before downloading, or you can dowload one of the desktop versions

# Desktop version

  You can download one of the desktop vertions too :D
  ![desktop](https://i.imgur.com/ixX0f9H.png)

  - [Windows](https://www.mediafire.com/file/6l79fv8gp22zw4p/LifeStyle-1.0.0_Setup.exe/file) | [direct donwload](https://download1348.mediafire.com/jw4kfohvnh7g/6l79fv8gp22zw4p/LifeStyle-1.0.0+Setup.exe)
  - [Linux rpm](http://www.mediafire.com/file/by48x28yez6sssx/my-app-1.0.0-1.x86_64.rpm/file) | [direct download](https://download1321.mediafire.com/inr3l0ycem4g/by48x28yez6sssx/my-app-1.0.0-1.x86_64.rpm)
  - [Linux deb](https://www.mediafire.com/file/wj7p13nnqk3r8p8/my-app_1.0.0_amd64.deb/file) | [direct download](https://download1586.mediafire.com/wddhpsfhmtag/wj7p13nnqk3r8p8/my-app_1.0.0_amd64.deb)
  - MacOS (comming soon... but not really)

# Features

## Featured article
The top image is selected based on the current number of votes from all articles
![Featured image](https://i.imgur.com/y58driP.png)

## Category selection
A list of all categories in the site sorted by priority
![category-selection](https://i.imgur.com/VsvxOLz.png)

## Article chess
Alist of all articles inside of a given category
![article-chess](https://i.imgur.com/xCzayxh.png)

## Article view
View of each article individualy
![article view](https://i.imgur.com/tEwFZsR.png)

## Article creation
Create articles from the app itself
![article-creation](https://i.imgur.com/B6fbEYD.png)

---
Created with:

- [Rails 6](https://rubyonrails.org/)
- [Ruby 2.7](https://www.ruby-lang.org/en/news/2019/12/25/ruby-2-7-0-released/)
- [Fontawesome](https://fontawesome.com/)
- [Animate.css](https://daneden.github.io/animate.css/)
- [simpleparallax](https://simpleparallax.com/)
- [Azure](https://azure.microsoft.com/en-us/)

---

Tested with:

- [rspec-rails](https://github.com/rspec/rspec-rails/issues)
- [capybara](https://github.com/teamcapybara/capybara)

Also a lot of help from:

- [devshints](https://devhints.io/)

---

Created by:

- 👤 [Joseph Flores](https://github.com/YoseptF)