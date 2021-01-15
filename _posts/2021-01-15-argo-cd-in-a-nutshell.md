---
layout: single
title: Argo CD in a nutshell
categories: tools
author: jannfis
date: 2021-01-15 07:52 -0600
---
Have you ever wanted to try out Argo CD, but its complexity and pre-requirements
has prevented you from doing so? Did you ever wanted to upgrade Argo CD to test
a new feature, or a bug fix, but your only environment is one that is not easily
upgradable, e.g. a production environment? Are you looking for a reproducible,
easy to set up demo environment to impress your co-workers or manager with Argo
CD?

Then
[Argo CD in a nutshell](https://github.com/jannfis/argocd-nutshell)
might be the right tool for you.

It will provide you with the most recent stable Argo CD release and a Kubernetes
cluster, all neatly wrapped up in a
[VirtualBox](https://www.virtualbox.org/)
VM running on your laptop or
workstation and provisioned by HashiCorp's great
[Vagrant](https://www.vagrantup.com/).
So Vagrant and VirtualBox need to be installed on your host in order for Argo
CD in a nutshell to work. That's it.

Provisioning works without any configuration required, as simple as:

```bash
git clone https://github.com/jannfis/argocd-nutshell
cd argocd-nutshell
vagrant up
```

And then, when you're done testing, you can simply dispose the environment using
the

```bash
vagrant destroy -f
```

command in the same directory.

The only requirement is that you must not have any interface on your host in the
`192.168.254.0/24` range, and that you also don't have an existing route into
this network, as it will be used by the Virtual Machine - but the range can be
overriden.

After the provisioning is finished, you can simply point your browser to the URL
`https://192.168.254.100/` and sign in to your fresh Argo CD installation, using
a login name of `admin` and password `admin` (it's intentionally left that easy).
No worries, Argo CD will only be accessible from your host.

You can also use `vagrant ssh` to get a console on the provisioned box and get
access to a pre-connected `argocd` CLI and tools such as `kubectl` and `kubens`
with command line completion already set up for you.

Argo CD in a nutshell uses
[K3s](https://k3s.io)
as Kubernetes variant, but will replace the `klipper` load balancer that comes
with K3s by `metallb` - so that you can deploy services of type `LoadBalancer`
in the VM and access it from your host. The default IP range that `metallb`
will use is `192.168.254.100` through `192.168.254.240`, with `192.168.254.100`
being used by Argo CD already.

Oh, and of course you can also install different versions of Argo CD, the CLI
or the underlying K3s. This is as simple as setting an environment variable
before running `vagrant up`, e.g. to install a specific version of Argo CD:

```bash
ARGOCD_VERSION=v1.8.1 vagrant up
```

Or, to use the latest, unreleased version built from `master` branch use:

```bash
ARGOCD_VERSION=HEAD vagrant up
```

There are more features available, so just check out the
[Argo CD in a nutshell GitHub repository](https://github.com/jannfis/argo-cd)
