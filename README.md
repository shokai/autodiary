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


LICENSE
=======
(The MIT License)

Copyright (c) 2012 Sho Hashimoto

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
