# Will It Dial

A simple customer phone number validator for lead validation. It's pretty paranoid and will not allow numbers that seem highly unlikely but are technically valid.

    WillItDial::US.check('404-514-6858') => true
    WillItDial::US.check('1-404-514-6858') => true
    WillItDial::US.check('404-555-5555') => false # Suspcious
    WillItDial::US.check('404-154-7372') => false # Can't start exchange code with 1
    WillItDial::US.check('404-054-7372') => false # Can't start exchange code with 0
    WillItDial::US.check('404-404-0404') => false # Suspicious, only 2 unique digits
    WillItDial::US.check('404-555-1212') => false # Explicitly banned
    WillItDial::US.check('247-464-2039') => false # Fake area code

Defaults to US

    WillItDial('404-332-1494') => true

## Installation

    gem install will_it_dial

## Todo

* Better configuration options, increase or decrease paranoia
* Build an international version

## Copyright

Copyright (c) 2010 Mark Percival. See LICENSE for details.
