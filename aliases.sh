#!/usr/bin/env bash

alias compile="javac -cp $JOGAMPPATH:."
alias run="java --add-exports java.base/java.lang=ALL-UNNAMED --add-exports java.desktop/sun.java2d=ALL-UNNAMED --add-exports java.desktop/sun.awt=ALL-UNNAMED -cp $JOGAMPPATH:."
