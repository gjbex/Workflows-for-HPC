# Checkpointing

There are several ways to checkpoint applications. If you are a developer, the
best way is to make sure that your application has facilities to checkpoint and
restart.  In case you are an application user and that application has no
facilities for checkpointing, you can use
[DMTCP](https://dmtcp.sourceforge.io/).


## What is it?

1. `simple-computation`: example of checkpointing a simple, single-threaded
   application using DMTCP.
1. `openmp`: example of checkpointing an OpenMP application using DMTCP.
