AutoDiary
=========
make diary automatically.

* https://github.com/shokai/autodiary


Environment
-----------
* Mac OSX or Linux
* zsh
* "setopt extended_history" in ~/.zshrc


Clone
-----

    % git clone git://github.com/shokai/autodiary.git


Install Dependencies
--------------------

    % gem install bundler
    % bundle install


Twitter Auth
------------
Autodiary uses <a href="http://shokai.github.com/tw">Tw</a> as front-end of Twitter Auth.

    % tw --help
    % tw --user:add

=> add twitter account.


Run
---

    % ruby autodiary.rb --help
    % ruby autodiary.rb --tweet USERNAME

