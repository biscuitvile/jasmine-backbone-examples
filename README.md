# There's coffee in your specs!

There is a fantastic tutorial on testing Backbone applications with
Jasmine and Sinon by Jim Newbery here on his Tinned Fruit blog:

http://tinnedfruit.com/2011/03/03/testing-backbone-apps-with-jasmine-sinon.html

I wanted to follow along with this but desired a few changes to the
setup.

1. Asset pipeline instead of `public/javascripts`
2. Jasmine Headless Webkit for a nicer TDD experience

This repo is the result in progress. One main thing to note right now is
my `jasmine.yml`:

    src_dir: app/assets/javascripts
    asset_paths:
    - lib/assets/javascripts
    - vendor/assets/javascripts
    src_files: [ 'application.js' ]

    spec_dir: spec/javascripts
    spec_files: [ '**/*[Ss]pec.*' ]
    helpers: [ 'helpers/**/*' ]

If you're using a gem that vendors Underscore and Backbone assets for
you, you may run into trouble getting Jasmine to see these dependencies
in the order you want using the `jasmine.yml` examples you see on the
web. The crucial portion here is specifying `src_files: [ 'application.js' ]` to get the load order you expect from your asset pipline setup.
