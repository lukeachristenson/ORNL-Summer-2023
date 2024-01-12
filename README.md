ORNL Summer 2023

This repository contains scripts that I created to test a variety of configurations of node-local storage
on a node of the fastest supercomputer in the world, frontier. 

The goal of node local storage is to have a temporary fast location to offload data during 
simulations or machine learning training so that precious computation time isn't lost while
waiting for checkpoints in simulations to be completed. 

The efficiency gains as a result of identifying ideal storage configurations in the form of the ideal RAID configuration
and LVM configuration will lead to great computational resources being saved for OLCF-6 the next system
that will be built at Oak Ridge National Lab which will be the fastest supercomputer in the world.

It is important to note that these tests were run and the scripts were created for a slightly different file
hierarchy than what currently exists in this repository. These differences exist because due to time limitations with
access to the Frontier(supercomputer) node, these scripts had to be constructed long before node access.
