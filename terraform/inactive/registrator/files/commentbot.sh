#!/usr/bin/env sh

julia -e 'using Registrator; Registrator.CommentBot.main()' config.commentbot.toml
