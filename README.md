OpenAura Coding Challenge
=========================

The Challenge
-------------

The OpenAura API serves up pieces of media and content associated to an artist.
Pieces of media relating to an artist are referred to as particles.  Every
particle comes from a remote provider, like Facebook.  We refer to the
intersection of an artist and a provider as a source, which in the case of
Facebook may be an artist’s band page.  You can read more and sign up for an api
key at http://developer.openaura.com/ and explore the api endpoints here
http://developer.openaura.com/docs/.  

One of the ways to demonstrate the power of the OpenAura platform is to display
the breadth of particles available for an artist by showing something from all
sources available, so that you don’t just get a list of Facebook particles where
an artist also has Twitter, Instagram, Youtube, etc.  To do this the standard
particles call in the OpenAura API returns particles in a round robin manner
with equal weighting by particle provider, ordered by date.  This results in an
equal distribution of recent particles per provider and a nice variation in the
returned set.  For example, if an artist only had three providers A, B and C,
the particle order would look like:  A1, B1, C1, A2, B2, C2, A3 … etc.

We’d like you to create a single page RAILS app that recreates the standard
particle response round robin structure by utilizing OpenAura API endpoints
other than the standard response and output the results to the page.  You will
need to use two endpoints to do this:  /v1/source/artists/{id} to pull an
artist’s sources, and /v1/particles/artists/{id} to pull an artist’s particles
by source.  Provider ordering is determined by the date the of the most recent
particle, per artist source.  The app must allow a user to choose between
multiple artists and to choose the size of the round robin slice.  Artist choice
can simply be a preset list of artists (2+) or an interface to a search, but
search is not required; if using preset list, please ensure the artist is
relatively popular with sufficient content (openaura.com a good place to check).
The slice determines how many particles per provider should appear in a row.  In
the three provider example above, slice = 1.  With slice = 2, it would look
like:  A1, A2, B1, B2, C1, C2, A3, A4, B3, B4, C3, C4 … etc.  You can bound the
slice value from 1 to 5.

The output and all user interactions on the page can by very simple - we are NOT
looking for the prettiest page and are more concerned with basic user
interactions and particle ordering.  The particle listing only needs to show
three things per particle:  the provider name, the date of the particle and the
particle id.  Showing the particle media on the page is not required.  You can
limit the particle list to the first 100 particles (more is okay).

How to setup the app and which gems to use are up to you, but we ask that the
OpenAura API requests are done in Ruby server side and not on the client side.
The whole thing could be done client side in JS but we’re interested in how you
structure a simple app and move data end to end.  Please let us know where to
checkout the project when you’re ready - something like Github.  Bonus points if
you want to have it live somewhere like Heroku, but not necessary.

There is no time limit but the goal is not to spend days of your time on this,
so please reach out at anytime for any questions you might have or if you get
stuck at any point.

Clarification:

Heads up on some things about the original requirements documentation that could
be more clear:

*   List should include the second rotation of the round robin.  For two sources
    and slice = 2, you should see:  A1, A2, B1, B2, A3, A4
*   Given that an artist (EG Taylor Swift) has multiple Twitter sources, we'd
    expect Twitter to appear more than once in the output.
*   Twitter should be the first provider in the ordering if it has the most
    recent particle.
*   Instead of the standard /particles endpoint, please use
    /v1/source/artists/{id} to pull an artist’s sources, and
    /v1/particles/artists/{id} to pull an artist’s particles by source.
