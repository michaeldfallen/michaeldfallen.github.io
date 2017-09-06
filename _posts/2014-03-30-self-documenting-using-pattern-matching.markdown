---
layout: post
title: "Self-documenting using pattern matching"
date: 2014-03-30 14:15:21
---

I'm a big fan of self-documenting code. The idea is that code is written in
a language humans can understand for a reason. It isn't meant to be read by a
computer, that's why we have compilers and interpreters, it's meant to be read
by other people. Or in fact by yourself, weeks or months after it was written.

So if code is meant to be read by people then it should be easy to understand.

Secondly code is written to fill a purpose. A purpose usually described in a
story, or a requirements document depending on your teams process, that once
finished usually will never be looked at again.

On [Register to Vote] we have quite a lot of rules and laws we have to follow,
often confusing and convoluted. Rather than writing extensive documentation
explaining why the code does what it does, I've been making a point of trying to
document the business rules in the code itself.

As it happens Scala has a very handy set of pattern matching abilities that has
made it very easy to do this.

[Register to Vote]: https://www.gov.uk/transformation/register-to-vote "#1"
<!--more-->

## Content based pattern matching

In scala you can match on the contents of a value by using backticks.

{% highlight scala %}
val foo = "foo"
val bar = "bar"

"foo" match {
  case `foo` => println("is foo")
  case `bar` => println("is bar")
}
=> is foo

{% endhighlight %}

This is a really handy way of explaining the buisness rules that inform your
code in a self documenting way.

For example we have to collect either a users Citizenship details or Passport 
details or neither, depending on a combination four facts about the user.

Below I've taken the match statement that determines which step you next move to
after the Passport step and first replaced the vals I use to explain the
buisness rule with their literal value.

{% highlight scala %}
(passport, bornInUk, before1983) match {
  case (true, _, _) => passportDetailsStep
  case (false, false, _) => citizenDetailsStep
  case (false, true, false) => citizenDetailsStep
  case (false, true, true) => nameStep
}
{% endhighlight %}

Of course I've left out a lot of code that extracts the different conditions out
of the users answers and boils them down to binary conditions.

Next the same code with content based pattern matching.

{% highlight scala %}
(passport, bornInUk, before1983) match {
  case (`hasPassport`, _, _) => passportDetailsStep
  case (`noPassport`, `notBornInUk`, _) => citizenDetailsStep
  case (`noPassport`, `wasBornInUk`, `notBornBefore1983`) => citizenDetailsStep
  case (`noPassport`, `wasBornInUk`, `wasBornBefore1983`) => nameStep
}
{% endhighlight %}

This leads to a longer function, as I have to use more lines to create the vals
that are used in the pattern match, but I don't agree with the concept that
short functions are fundamentally easier to understand. 

At least in my opinion, the pros out way the cons, it's much clearer and easier
to understand the different conditions when their IRL descriptions are used.

