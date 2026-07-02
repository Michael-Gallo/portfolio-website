---
title: Why I left Proton
date: 2026-06-08
description: A lot going for it, but with too many trade-offs.
tags:
  - Proton
  - Open Source
---

I switched to [ProtonMail](https://proton.me/) 6 years ago, seeking privacy and a way to De-Google my life.  For most of that time, I was a happy customer. Over time I started exploring the entire Proton suite and realized that none of it was for me.  

### Maximum Privacy means Low Interoperability
Proton's main selling point is privacy, what I didn't realize six years ago was the price that privacy comes at. The internet runs on open standards like IMAP and CalDAV that make it so we can choose our own applications and commingle. What you don't realize when you switch to Proton, is that you are putting up a barrier in the way of interoperability.

I, like many people, have multiple email accounts, not all managed by me (a school email, for example). Naturally I want a unified way to manage them and their notifications, which inherently requires a third party app. Proton has a [bridge](https://proton.me/mail/bridge) program you can use on desktop to work with third party apps, but it's enough hassle where I never used it and just managed all ProtonMail on their website. On mobile, there is no bridge so you must run multiple apps. 

It is a similar issue with their calendar, Proton does [not support CalDAV](https://protonmail.uservoice.com/forums/284483-proton-mail-calendar/suggestions/49566101-caldav). What this means is that you absolutely must use Proton Calendar to properly respond to invitations. I do in-principle want to be able to use third party calendar programs, but I do not know enough about the domain to know if there's a hard engineering trade-off between lock-in and security that Proton is forced to make here. What I know for certain is this: Proton Calendar is not fit for purpose, and that is fully in Proton's control to fix. Which brings me to- 


### Missing Basic Features
Proton has a well-established pattern of releasing software without table-stakes features before moving on to the next thing.

Proton Calendar is missing incredibly basic functionality. Built into the iCalendar specification is a [Exception Date](https://datatracker.ietf.org/doc/html/rfc5545#section-3.8.5.1) property that lets you say no to a single recurrence of an event. For some god-forsaken reason, Proton Calendar does not support this. I was put in the awkward situation where someone invited me to a recurring event, I needed to decline a single recurrence, and I had no way to communicate that I would not show up other than to decline all recurrences until the end of time. I don't know of any other calendar app that's missing this feature, and it's fundamentally incredibly simple functionality. Since people naturally send calendar invites to your email and expect you to RSVP from there, this problem can't even be seen as isolated to their calendar product, it infects their mail service as well.


![Proton will not let you decline a singular instance of a recurring event](/blog-images/hello-rails-blog/proton-forcing-multi-event-changes.webp)


I had a similar feeling when testing out Proton Pass. I use the keyboard for everything, and consider it a non-negotiable for productivity software. I have been using [BitWarden](https://bitwarden.com/) for many years, and decided to give Proton Pass a shot after seeing a largely positive reception online. That's when I found an immediate deal-breaker, there [are no keyboard-shortcuts on browser](https://protonmail.uservoice.com/forums/953584-proton-pass-authenticator/suggestions/48140276-keyboard-shortcuts). This is incredibly basic functionality that was requested back in March of 2024, and set to "work in progress" in November of 2025. It is June of 2026 and we still do not have this feature. At the risk of sounding like a broken record: This is the only mainstream password manager on the market that I know of that works like this; LastPass has keyboard shortcuts, 1Password has keyboard shortcuts, Bitwarden has keyboard shortcuts, Dashlane has keyboard shortcuts.

Proton Drive, 4 years post-release, is still missing Linux support, although they've announced a [rework yesterday to make it possible](https://proton.me/blog/drive-sdk-june-2026).  Proton openly touts privacy as a "human right", but somehow that doesn't translate to supporting the only home-user operating system that's built to respect it. 


### Moving On - Finding Solid Operators

Moving away from Proton, I was looking less for companies with one specific selling point and more for companies who have an all-around outstanding reputation for being solid operators.

I wanted to make sure that this was going to be the last time I would ever need to give all of my contacts and accounts a new email address, and that means not being reliant on my email provider to give me a domain. I already had the `michaelgallo.dev` domain this website is hosted on, so I transferred it over to [PorkBun](https://porkbun.com/), which from what I have seen seems to have the best reputation of all the domain registrars.

I heavily considered giving Hey and/or Superhuman a shot, with their advocates saying that they're revolutionary. But, as I've established, interoperability is really important to me, and if I didn't care about privacy at all I would have never been on Proton in the first place. With that in mind, I went with [FastMail](https://www.fastmail.com/). Fastmail's website has consistently been really snappy and they do not data mine. It may be anecdotal but it seems like less of my email gets lost with Fastmail as well. Because FastMail is able to actually support web standards, I have went back to using third party applications for my email and calendar. I am now managing my email on mobile with [FairEmail](https://email.faircode.eu/) and on desktop with [Thunderbird](https://www.thunderbird.net/en-US/).  On mobile I use [Etar](https://f-droid.org/en/packages/ws.xsoh.etar/) and on desktop I use [Evolution](https://wiki.gnome.org/Apps/Evolution) to manage my calendar.

For storage, I was on other solutions before I decided to leave Proton. I have been using [Backblaze B2](https://www.backblaze.com/cloud-storage), with [rclone](https://rclone.org/) for automation, as my backup solution for years.  I have also been really happy so far using [Pcloud](https://www.pcloud.com/), another Swiss privacy respecting company, to sync my data across my devices (both Linux and Android).
