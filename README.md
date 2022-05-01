# RDMA playground

That is a playground for [async-rdms](https://github.com/datenlord/async-rdma). If you don't have rdma compatible set up, go for it

I got init setup from https://github.com/haggaie/rdma-experiment

Run as:

```
vagrant up
vagrant ssh
```

If you would like to add more stuff for the image,

- edit [setup-vm.sh](packer/scripts/setup-vm.sh)
- get an accesstoken from vagrant cloud
- build image

```bash
VAGRANT_CLOUD_TOKEN=<token> ./build.sh

```

# VScode remote coding

fetch ssh required parameters

```bash
 vagrant ssh-config
 Host default
  HostName 127.0.0.1
  User vagrant
  Port 2222
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile <vagrant container path>/.vagrant/machines/default/virtualbox/private_key
  IdentitiesOnly yes
  LogLevel FATAL
```

you can ssh like:

```bash
ssh -i <IdentityFile>  -o PasswordAuthentication=no <user>@<ip> -p <ssh port>
```

### Visual Code

- Open Visual Studio Code. Open your “Extensions” (the set of boxes on the left) and search for “Remote Development”. This is a set of plugins from Microsoft
- Navigate to View -> Command Palette in the menu (or use the keyboard shortcut, it’s Ctrl + Shift + P on Windows). In the palette, search for “SSH”
- When it finishes, you can click “Open Folder”. You are presented with a list of directories on the remote system
- Rust Analyzer is nowhere to be seen! Once again, click the “extensions” button and search for “Rust Analyzer”. There’s a tiny button reading Install in SSH: <ip> next to the list entry for Rust Analyzer

## _vualá_
