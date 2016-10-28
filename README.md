This is a small chat, where logged users can write small posts, edit and delete own posts.
Guests can only watch all posts.

To enjoy of whole functionality of this service you need to have account in social network [*VK*](https://vk.com). Use it for regestration.

Technical requirements.
You can run this servise on your PC. For this you should do next steps:

- use PC with *nix operating system;
- download this project from github (in comand prompt type: git clone https://github.com/andreykraveckiy/wall_posts);
- enter "cd wall_posts" + ENTER and follow to the project folder;
- install required gems for project, use command: "bundle update" and "bundle install";
- for preparing you need to istall a database. Enter in command prompt: "bundle exec rake db:migrate" + ENTER. You can also create test users with "bundle exec rake db:populate";
- you can prepare database for test also. Use this: "bundle exec rake test:prepare" + ENTER.
- in project's folder enter "rails s" and type ENTER;
- open your favorite browser and enter in the adress bar "localhost:3000".
- you are welcome to the start page of "Wall posts" application!