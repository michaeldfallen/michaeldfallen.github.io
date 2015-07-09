---
layout: post
title: "Some people are never (ever (never ever)) a user"
date: 2015-04-06 16:31:00
---

{% include series/story-writing/header.markdown %}

In the last post in this series, [Rule 4 - Many Users of many types], I gave a
very loose definition of what I call a user. That was:

>A user is "someone who will use a product of our teams work to do
something".

Some people this doesn't cover are: your Security Accreditor, your Chief
Technology Officer, your Single Responsible Officer, the team themselves.
These people can never ever be users. That's a pretty bold statement but I
think I can back it up.

##Masquerading Requirements

Lets take the Security Accreditor as an example. Can we really pretend that:

    As a user who has logged in
    I want my other sessions to be terminated
    so that no one can impersonate me on another device

is a thing the user wants? Really? Has any user ever said “I really hate when I
log in to something on two devices and it lets me”?!

That's a Security Accreditor requirement, a risk mitigation, that's being
masqueraded as a feature.

##Be honest about it's business value

If we were honest about the session termination story about we would write the
story like this:

    As Security Accreditor
    I want users old sessions to be terminated when they log in
    so that no one can impersonate them on another device

But this violates the definition of a User Story that I mentioned above, since
Security Accreditor doesn't use the system to do something.

The same goes for features required by the team, or the CTO, or an Enterprise
Architect, etc. They will have very good reasons but they aren't users and
so User Stories aren't a suitable way to describe them.

##Use Feature Injection

This is where [feature injection] can be used to good effect:

    In order to prevent fraudsters impersonating users
    the Security Accreditor needs us
    to terminate old sessions when a user logs in

or if we can't find a real reason for it:

    In order to satisfy the Security Accreditor
    the Auth component will need to
    to terminate old sessions when a user logs in

Here you have all the information needed to fully describe why we are doing this
and we are describing it honestly. If the only reason we can find to do it is
the "satisfy the Security Accreditor" one then at least we are being honest in
admitting that.

##They don't use it

The crux of this argument is that people who don't "use a product of our teams
work to do something", including Security Accreditors, CTOs, Enterprise
Architects, the team themselves, etc, can't have their needs defined as user
needs because they aren't users. Their requirements may indeed deliver business
value, not leaking personal information is often valuable to a business, but we
need to be honest when describing those requirements.

With this honest context we've given the Product Owner the most information we
can about this feature. It's then up to them to prioritise the work and have
any arguments with the Accreditor in order to decide to implement this feature.

{% include series/story-writing/header.markdown %}
{% include series/story-writing/links.markdown %}
