clear 

@ 00,00 to 25,75 double 

// @ 01,05 say Asc('w') // 119
// @ 02,05 say Asc('a') // 97
// @ 03,05 say Asc('s') // 115
// @ 04,05 say Asc('d') // 100
// @ 05,05 say Asc('W') // 87
// @ 06,05 say Asc('A') // 65
// @ 07,05 say Asc('S') // 83
// @ 08,05 say Asc('D') // 68

nPositionX := 13
nPositionY := 33

cPersonagem := 'o'
@ nPositionX,nPositionY say cPersonagem

Inkey(0)
do while .t.
    if LastKey() == 119 .or. LastKey() == 87
        @ nPositionX,nPositionY clear to nPositionX,nPositionY
        nPositionX--
        if nPositionX == 00
            nPositionX := 74
            @ nPositionX,nPositionY say cPersonagem
        endif
        @ nPositionX,nPositionY say cPersonagem
    elseif LastKey() == 97 .or. LastKey() == 65
        @ nPositionX,nPositionY clear to nPositionX,nPositionY
        nPositionY--
        if nPositionY == 00
            nPositionY := 24
            @ nPositionX,nPositionY say cPersonagem
        endif
        @ nPositionX,nPositionY say cPersonagem
    elseif LastKey() == 115 .or. LastKey() == 83
        @ nPositionX,nPositionY clear to nPositionX,nPositionY
        nPositionX++
        if nPositionX == 25
            nPositionX := 01
            @ nPositionX,nPositionY say cPersonagem
        endif
        @ nPositionX,nPositionY say cPersonagem
    elseif LastKey() == 100 .or. LastKey() == 68
        @ nPositionX,nPositionY clear to nPositionX,nPositionY
        nPositionY++
        if nPositionY == 75
            nPositionY := 01
            @ nPositionX,nPositionY say cPersonagem
        endif
        @ nPositionX,nPositionY say cPersonagem
    endif
    Inkey(0)
enddo
