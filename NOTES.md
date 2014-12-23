# Notes for contributors

## table_of_contents.yaml

Each of the items in the `days` array is expected to be a prefix to what
could be multiple videos. This is how we handle separate QA videos, and
how we'll be able to be programmatic about days with multiple videos or
specials with multiple segments in the future.  So if there's a category
like this:

    {
     title: Intro to C
     folder: intro-to-c
     description: >
         This is the intro to C week.
     days: [day1, day2, day3, day4, day5]
    }

Then day1 will slurp up `day1.html.md` and `day1qa.html.md`.  Likewise,
if Casey adds a followup to his emacs video, we can just drop a file 
in the misc folder called "emacs_2_emacs_harder.html.md" and everything
will just work with no changes needed to any index files since there's
already an emacs category ready to go.

In instances where the day name could be ambigious (for instance, day1
of C week could accidentally match day100), the optional folder parameter
can be included.  But by default it searches through everything which
is usually completely fine.

If you want to include a message instead of a link to a video, e.g.
Day025: Airs at 11PM on December 17th, you can just include that inline
like so:

    days: [day1, day2,
          'Day3: Aired but still being processed by Youtube',
          'Day4: Airing tomorrow. Same Owl Time, Same Owl Channel.']

And the index will do the right thing.
