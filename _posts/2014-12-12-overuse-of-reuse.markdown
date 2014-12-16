---
layout: post
title: "Overuse of reuse"
date: 2014-12-15 12:49:00
---

I'm currently working with the Department for Work and Pensions and I've found
that not everyone means the same thing when they say "reuse". This has led to me
sitting in meetings telling people "this won't be reusable" to people who think
reusable means something different than I.

As I see it we are building a single service that will be deployed once and
other services will hook in to it. I'd call that "sharing", it's a form of reuse
but it's not the only one. It's also worth noting that it's a very hard thing
to do.

<!--more-->

##Types of Reuse

On the recommendation of my team I've decided to write down what I see as the
different types of reuse and what I think of as suitable language for each type:

###Reuse as in Recycle

This is what I mean when I say reuse. As an analogy I have a bottle filled with
water. If I drink it all and then fill it up again I am reusing it. In software
I can easily give you a duplicate copy of my bottle. So you can reuse my work
by filling your copy with water and drinking from it.

In this type of reuse I give you my source code and you deploy another instance
of it. It then performs the same way it would for me, perhaps with a few
configuration changes to suit your needs.

This is one of the hardest kinds of reuse as it means I need to predict your
needs, which is very hard on the first attempt.

An example of this would be most desktop applications, like Google Chrome. With
a few configuration changes, like logging in to my Google account, I can reuse
the software without having to write it myself.

**Summary** - Where I build something and you take it and make use of it without
much work needed to customise.

**Suitable language** - Reuse it, deploy it, use it.
The emphasis is on you doing something with someone else's work.

----

###Building on top of it

In this type lets say I'm building a skyscraper. I decide to make it from steel
and construct some girders of the lengths I need. I then offer my girders to you
so you can build your house. Since your house is smaller you need to make some
changes so they suit your needs, such as trimming them to length.

In the software world this is where I publish pieces of my work (say that
super awesome Mustache [SBT plugin]), which you download and make use of in your
development as the basis of something else. That may be taking pieces of my code
and using that as the foundation of your own components. Or it may be taking
entire components and using them in your system.

This is the very foundation of open source development. You still need to do some
work but it saves a lot of effort. This is the most useful type in my opinion as
it's the most flexible. And the development world seems to agree as this is how
many libraries and tools are built.

Good examples are: [Play], [SBT], [Maven], [Dropwizard], [Rails], [Gatling],
[Java], [Scala], [Ruby], [Mongo], [Postgres], [SQL Server] that awesome
[SBT plugin] someone wrote... Honestly the list is nearly endless.

Unfortunately this is the type that most "business minded" people dislike. They
tend to think that it's a waste of time to build something, use it to fix your
problem, and *then* let others use it to fix their own problems. They would
rather build one thing which fixes everyone's problems.

The issue with this line of reasoning is you can never fully understand their
problems, unless you make them your own.

**Summary** - Where I build something then you take it and build something else
using it.

**Suitable language** - Extend, build from, build on top of, build out of.
The emphasis is on you adding value to my work.

----

###Sharing it

Finally I think this is the last type, at least that I can think of. This is when
I build a swimming pool because I want to swim to keep fit. I could publish my
specs and designs and lists of building materials but swimming pools are large
and expensive. So instead I let you use my swimming pool for your Olympics
training, water polo classes, blitsball games, or just to have fun splashing
around.

This is *by far* the hardest type of reuse as I need to fully understand your
needs before you start using the thing. That's a really hard thing to do.

In the swimming pool example I could build myself a small simple pool and be
done. To let others use it for their purposes I might need to make it bigger,
provide changing rooms, build a diving board, etc. That's a lot more things I
need to do due to the increased number of use cases I have to consider.

It's also, unfortunately, the type those "business" people love. Because they
think you can save effort, by building it once. Obviously this means you save
money and effort because their aren't two teams building so similar things.

I'm not saying it's a bad thing though, it's is a very important and often very
good thing to do. We only have one internet, one GOV.UK, one Facebook and we all
have to share the same one because it would be silly for me to
[build my own Facebook].

**Summary** - Where I build something and then let you make use of my instance
of it.

**Suitable language** - Hook in to, connect to, call to, talk to.
The emphasis is on you interacting with my instance of the thing.

----

##Focus on the Needs

It should be boring to hear by now but everything you do in Agile should focus
on the Needs. For a while I've thought that sometimes we focus too often on the
users that sit in front of web browsers. Obviously they are important, the most
important for a citizen facing service, but they aren't necessarily the only
users.

When building a reusable component, or shared service, or tool for others to
build on top of, you'll have another user. The Developer sitting in front of
code trying to use your tool, or the Architect trying to understand your
services processes are users too. You need understanding of their context to
be able to build anything that will be useful to them.

Which type of reuse you use depends heavily on your user and business needs.
Perhaps you are interested in maintaining centralised control of a resource;
then sharing might be most appropriate. Or you want to reduce implementation
cost of a common piece of work; then reuse might make most sense.

When someone demands that something be a certain type of "reusable" ask them
why.


##Wrapping up

So as I see it there are 3 things people tend to mean when they say reuse. We
should try to get away from using reuse and instead use more specific language
for each task.

**Reuse** Where I build something and you take it and make use of it without
much work needed to customise.

*Suitable language* - Reuse it, deploy it, use it.
The emphasis is on you doing something with someone else's work.


**Build on top of** - Where I build something then you take it and build
something else using it.

*Suitable language* - Extend, build from, build on top of, build out of.
The emphasis is on you adding value to someone else's work.


**Sharing** - Where I build something and then let you make use of my instance
of it.

*Suitable language* - Hook in to, connect to, call to, talk to.
The emphasis is on you talking to my instance of it.

When someone asks for code to be "reusable" you can point to this and ask
"yes, but in what sense?".


[build my own Facebook]: http://www.Ihave50dollars.com
[Play]: https://www.playframework.com/
[SBT]: http://www.scala-sbt.org/
[Maven]: http://maven.apache.org/
[Dropwizard]: http://dropwizard.io/
[Rails]: http://rubyonrails.org/
[Gatling]: http://gatling.io/
[Java]: http://www.java.com/en/
[Scala]: http://www.scala-lang.org/
[Ruby]: https://www.ruby-lang.org/en/
[Mongo]: http://www.mongodb.org/
[Postgres]: http://www.postgresql.org/
[SQL Server]: http://www.microsoft.com/en-gb/server-cloud/products/sql-server/
[SBT plugin]: https://github.com/michaeldfallen/sbt-mustache
