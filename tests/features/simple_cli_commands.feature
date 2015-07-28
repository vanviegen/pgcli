Feature: run the cli,
  call the help command,
  exit the cli

  Scenario: run the cli
     Given we have pgcli installed
      when we run pgcli
      then we see pgcli prompt

  Scenario: run "\?" command
     Given we have pgcli installed
      when we run pgcli
      and we wait for prompt
      and we send "\?" command
      then we see help output

  Scenario: run the cli and exit
     Given we have pgcli installed
      when we run pgcli
      and we wait for prompt
      and we send "ctrl + d"
      then pgcli exits

  Scenario: create and drop temporary database
     Given we have pgcli installed
      when we run pgcli
      and we wait for prompt
      and we send "create database" command
      then we see database created
      when we send "drop database" command
      then we see database dropped
      when we send "ctrl + d"
      then pgcli exits

  Scenario: connect and disconnect from test database
     Given we have pgcli installed
      when we run pgcli
      and we wait for prompt
      and we connect to test database
      then we see database connected
      when we connect to postgres
      then we see database connected
      when we send "ctrl + d"
      then pgcli exits

#  Scenario: create, insert, select from, update, drop table
#     Given we have pgcli installed
#      when we run pgcli
#      and we wait for prompt
#      and we connect to test database
#      then we see database connected
#      when we send "create table"
#      then we see table created
#      when we send "ctrl + d"
#      then pgcli exits
