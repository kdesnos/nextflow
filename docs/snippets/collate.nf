channel.of(1, 2, 3, 1, 2, 3, 1)
    .collate( 3 )
    .view()