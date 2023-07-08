Pass SSH askpass
================

A small script to help load passphrases for SSH keys from `pass`, the standard unix password manager.

The keys are searched by SSH key comment in pass `ssh/<comment>`

Try it out, invoke `ssh-add` in the following way:

```shell
env SSH_ASKPASS=./pass-ssh-askpass.sh SSH_ASKPASS_REQUIRE=force ssh-add -vvv
```

It should print the following in debug
```shell
yarek@linux:~/Play/pass-ssh-askpass$ env SSH_ASKPASS=./pass-ssh-askpass.sh SSH_ASKPASS_REQUIRE=force ssh-add -vvv
debug1: read_passphrase: stdin is not a tty
Extracted key filename /home/yarek/.ssh/id_rsa
Comment from keyfile /home/yarek/.ssh/id_rsa is yarek@axiom
got passphrase for comment yarek@axiom: XXX
Identity added: /home/yarek/.ssh/id_rsa (yarek@axiom)
```

Install in a convenient location, such as `/usr/local/bin`.

```shell
sudo cp -v ./pass-ssh-askpass.sh /usr/local/bin/
sudo cp -v ./pass-ssh-add /usr/local/bin/
```
