---
layout: post
title: "Who-What-Why not Who-What-What"
date: 2015-03-26 10:23:00
---

{% include series/story-writing/header.markdown %}

A story is formed of three parts. Who has the need, What is the need and Why do
they have it.

A rookie mistake I often found myself making was
confusing the Why and the What so that my stories read like this:

    As a User
    I want to do the thing
    so that I have done the thing.

A story like this isn’t useful because it doesn't describe the Why.
<!--more-->
The simple, though not strictly correct, guide that I use is:

**If you can make the Why a What then it's not the real reason.**

For example:

    As a case worker
    I want a list of my open cases
    so that I can track my cases

This can be written as:

    As a case worker
    I want to track my cases
    so that ...

It's not a perfect guide but it can be useful for noticing when a story isn't
capturing the real reason.

## Dishonest Stories

Sometimes a story like this will be hiding something from the team. The real
reason was usually because “the thing” wasn’t something anyone in their right
mind would want to do, but we were forced to do it due to security / red tape /
stakeholders (pick one).

If we had been honest the story would read:

    As a User
    I want to do the thing
    so that Security are happy that I’ve done the thing that they promise will
    make the system more secure but never really explain how or why.

or

    As a User
    I want to do the thing
    so that this backend business process that we need for auditing purposes has
    the things it needs to do it’s job.

Does the user really want this thing?

In these cases we switched to [Feature Injection] (thanks for the tip, Tim) to
more honestly capture the purpose behind the story and found it really helped us
focus on the benefit of the stories.

    In order to properly secure the system
    Security need the User
    to do the thing

It wasn’t user-facing benefit but there was a benefit to someone, usually
someone with a budget to worry about or a neck on the line, but that benefit is
still real and worth understanding.


{% include series/story-writing/header.markdown %}
{% include series/story-writing/links.markdown %}

[Feature Injection]:http://lizkeogh.com/2008/09/10/feature-injection-and-handling-technical-stories/
