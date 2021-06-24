# Exercises

 1. For this course, you need to be using a Unix shell like Bash or ZSH. If you
    are on Linux or macOS, you don't have to do anything special. If you are on
    Windows, you need to make sure you are not running cmd.exe or PowerShell;
    you can use [Windows Subsystem for
    Linux](https://docs.microsoft.com/en-us/windows/wsl/) or a Linux virtual
    machine to use Unix-style command-line tools. To make sure you're running
    an appropriate shell, you can try the command `echo $SHELL`. If it says
    something like `/bin/bash` or `/usr/bin/zsh`, that means you're running the
    right program

    **Solution:**
    ```
    echo $shell
    /bin/bash
    ```

 1. Create a new directory called `missing` under `/tmp`.

    **Solution:**
    ```
    mkdir /tmp/missing
    ```

 1. Look up the `touch` program. The `man` program is your friend.

    **Solution:**
    ```
    man touch
    ```
 1. Use `touch` to create a new file called `semester` in `missing`.

    **Solution:**
    ```
    cd /tmp/missing
    touch semester
    ```
 1. Write the following into that file, one line at a time:
    ```
    #!/bin/sh
    curl --head --silent https://missing.csail.mit.edu
    ```
    The first line might be tricky to get working. It's helpful to know that
    `#` starts a comment in Bash, and `!` has a special meaning even within
    double-quoted (`"`) strings. Bash treats single-quoted strings (`'`)
    differently: they will do the trick in this case. See the Bash
    [quoting](https://www.gnu.org/software/bash/manual/html_node/Quoting.html)
    manual page for more information.

    **Solution:**
    ```
    cd /tmp/missing
    echo '#!/bin/sh' > semester
    echo 'curl --head --silent https://missing.csail.mit.edu' >> semester
    ```
    *Note: >> Appends the output at the end of the file instead of overwriting
 1. Try to execute the file, i.e. type the path to the script (`./semester`)
    into your shell and press enter. Understand why it doesn't work by
    consulting the output of `ls` (hint: look at the permission bits of the
    file).

    **Solution:**
    ```
    ./semester
    ```
    Returns the error:
    ```
    bash: ./semester: Permission denied
    ```
    Running:
    ```
    ls -l semester
    ```
    Returns:
    ```
    -rw-r--r-- 1 pa emanubuntuvm 61 Jun 23 11:38 semester
    ```
    Hence we don't have the execute permission
 1. Run the command by explicitly starting the `sh` interpreter, and giving it
    the file `semester` as the first argument, i.e. `sh semester`. Why does
    this work, while `./semester` didn't?

    **Solution:**

    `sh semester` creates a new `sh` process which reads and runs the executable contents, and works since we have execution permissions for`sh` , and read permissions for smester. `./semester` fails as it tries to execute the script directly, which we do not have permissions for.

 1. Look up the `chmod` program (e.g. use `man chmod`).

    **Solution:**
    ```
    man chmod
    ```
 1. Use `chmod` to make it possible to run the command `./semester` rather than
    having to type `sh semester`. How does your shell know that the file is
    supposed to be interpreted using `sh`? See this page on the
    [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)) line for more
    information.

    **Solution:**
    ```
    chmod u+x semester
    ```
    We give (+) execute permission (x) to the user who owns the file (u).
 1. Use `|` and `>` to write the "last modified" date output by
    `semester` into a file called `last-modified.txt` in your home
    directory.

    **Solution:**
    ```
    ./semester | grep last-modified > last-modified.txt
    ```
 1. Write a command that reads out your laptop battery's power level or your
    desktop machine's CPU temperature from `/sys`. Note: if you're a macOS
    user, your OS doesn't have sysfs, so you can skip this exercise.
