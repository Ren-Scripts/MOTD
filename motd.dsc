# RenMotd (22.02.2023)

# By RenTar (Rorkh)
# https://github.com/Rorkh

motd_config:
    type: data
    debug: false

    # Enabled? (takes action on server restart)
    enabled: true

    # Delay in denizen time (100t/1s/1m or smth else)
    delay: 60s

    # List of phrases
    phrases:
        - <&f>Info <&8>><&f> Report bugs in our Discord<&nl><&f>Info <&8>><&f> Link: ...

motd_events:
    type: world
    debug: false

    events:
        after server start:
            - if <script[motd_config].data_key[enabled]>:
                - run motd_show delay:<script[motd_config].data_key[delay]>

motd_show:
    type: task
    debug: false

    script:
        - announce <script[motd_config].data_key[phrases].random.parsed>
        - run motd_show delay:<script[motd_config].data_key[delay]>