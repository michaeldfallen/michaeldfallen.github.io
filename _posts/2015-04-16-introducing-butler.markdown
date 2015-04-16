---
layout: post
title: "Introducing Butler"
date: 2015-04-16 16:48:00
---

I am a supremely lazy person. I joined a python project and had to remember
really long commands like:

**Run my tests**

    foreman run python test.py all

**Run only unit tests**

    foreman run python test.py unit

**Run the database migrations**

    foreman run python app.py db migrate

I figure someone else should be remembering those for me.

##Butler

The Butler is a small command line tool for reducing the number of keystrokes I
need to make while working.

The code can be found on [github](https://github.com/michaeldfallen/butler).

###Demo

<script type="text/javascript" src="https://asciinema.org/a/18812.js" id="asciicast-18812" async data-loop="true" data-autoplay="true"></script>

###How to use Butler

It's pretty easy to get started. Just install it from brew:

    brew install michaeldfallen/formula/butler

Then create a `butlerfile` with a command in it:

    echo "hello: echo \"Hello, world!\"" >> butlerfile

Your `butlerfile` will look like this:

    hello: echo "Hello, world!"

Now you can ask Butler to run the command:

    butler hello

And Butler will execute the script behind it for you.

###Safety checks

Since running commands from a file isn't entirely safe, especially if teams use
Butler together, you'll want to be certain that the command is safe.

To do this Butler will show you the script and ask if it's ok to run the first
time. Any time the script, or the name of the command, changes Butler will ask
again if it's safe to run. So you won't get caught by a sneaky `rm -rf ~`.

<script type="text/javascript" src="https://asciinema.org/a/18814.js" id="asciicast-18814" async data-loop="true" data-autoplay="true"></script>

###Tab-completion

Any commands in your butlerfile will autocomplete in both Bash and Zsh, just add
this to your `~/.zshrc` or `~/.bashrc`:

    source "$(butler --init-completion)"

And you get sexy tab completion:

<script type="text/javascript" src="https://asciinema.org/a/18813.js" id="asciicast-18813" async data-loop="true" data-autoplay="true"></script>

##So Happy!

I've been using Butler over the last week and it's made me so happy. No more
long confusing commands.

One other thing I've noticed is that the `butlerfile` makes for useful
documentation. If anyone asks "How do you run the tests?" I can look in that
projects `butlerfile` and show them.
