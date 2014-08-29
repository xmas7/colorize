# Colorize

## What?

Pretty print log files.

## How?

### input.txt

    2014-08-28 09:58:36,890 404 http://www.example.com 127.0.0.1 Cannot say how awesome this is.
    2014-08-28 09:59:36,890 404 http://www.example.com/login.html 127.0.0.1 Wait...
    2014-08-28 10:00:36,890 404 http://www.example.com/secure.html 127.0.0.1 Actually I can

### command

    cat input.txt | colorize.sh 0,2

### output

    **2014-08-28** 09:58:36,890 **404** http://www.example.com 127.0.0.1 Cannot say how awesome this is.
    **2014-08-28** 09:59:36,890 **404** http://www.example.com/login.html 127.0.0.1 Wait...
    **2014-08-28** 10:00:36,890 **404** http://www.example.com/secure.html 127.0.0.1 Actually I can


# Donate

If you like this script you can donate to... nah I'm just kiddin.
