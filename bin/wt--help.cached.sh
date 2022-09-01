#!/bin/sh

#---------------------------
#Help
#---------------------------
cat << .
[[ cached from wt.exe version 1.14.220715002 ]]

wt - the Windows Terminal
Usage: [OPTIONS] [SUBCOMMAND]

Options:
  -h,--help                   Print this help message and exit
  -v,--version                Display the application version
  -M,--maximized Excludes: --fullscreen
                              Launch the window maximized
  -F,--fullscreen Excludes: --focus --maximized
                              Launch the window in fullscreen mode
  -f,--focus Excludes: --fullscreen
                              Launch the window in focus mode
  -w,--window TEXT            Specify a terminal window to run the given commandline in. "0" always refers to the current window. 
  -s,--saved INT              This parameter is an internal implementation detail and should not be used.

Subcommands:
  new-tab                     Create a new tab
  nt                          An alias for the "new-tab" subcommand.
  split-pane                  Create a new split pane
  sp                          An alias for the "split-pane" subcommand.
  focus-tab                   Move focus to another tab
  ft                          An alias for the "focus-tab" subcommand.
  move-focus                  Move focus to the adjacent pane in the specified direction
  mf                          An alias for the "move-focus" subcommand.
  move-pane                   Move focused pane to another tab
  mp                          An alias for the "move-pane" subcommand.
  swap-pane                   Swap the focused pane with the adjacent pane in the specified direction
  focus-pane                  Move focus to another pane
  fp                          An alias for the "focus-pane" subcommand.
.
#---------------------------
#OK   
#---------------------------
