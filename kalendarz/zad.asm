.686
.model flat

extern _ExitProcess@4 :PROC
extern __write : PROC
extern __read : PROC
public _main

.data
wczytane_slowo		dw 80 dup(0),0
wypisane_slowo		dw 160 dup(0),0
liczba_znakow		dd ?


.code
_main	PROC

	push 80
	push OFFSET wczytane_slowo
	push 0
	call __read
	add esp,12

	mov liczba_znakow,eax
	mov ecx,eax
	mov ebx,0
	mov edx,0

ptl:
	mov ebp,0
	mov al,byte ptr wczytane_slowo[ebx]
	cmp al,61H
	ja miesiac
	movzx ax,al
	mov wypisane_slowo[edx],ax
	jmp koniec

miesiac:
	cmp al,73H
	je styczen_sierpien
	cmp al,6CH
	je luty_lipiec_listopad
	cmp al,6DH
	je marzec_maj
	cmp al,6BH
	je kwiecien
	cmp al,63H
	je czerwiec
	cmp al,77H
	je wrzesien
	cmp al,70H
	je pazdziernik
	cmp al,67H
	je grudzien

	jmp dopisz

styczen_sierpien:
	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'t'
	je styczen
	cmp al,'i'
	je sierpien
	jmp dopisz

styczen:
	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'y'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'c'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'z'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'e'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,228
	jne dopisz

	mov byte ptr [wypisane_slowo + edx], '1'  ; 
    inc edx  ; Przesuñ wskaŸnik wyjœciowy do nastêpnej pozycji

    add ebx, ebp  ; Przesuñ ebx o d³ugoœæ przetworzonego miesi¹ca
	jmp koniec

sierpien:
	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'e'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'r'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'p'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'i'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'e'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,228
	jne dopisz

	mov wypisane_slowo[edx],'8'
	inc edx  ; Przesuñ wskaŸnik wyjœciowy do nastêpnej pozycji
    add ebx, ebp  ; Przesuñ ebx o d³ugoœæ przetworzonego miesi¹ca
	jmp koniec

luty_lipiec_listopad:
    inc ebp
    mov al, byte ptr [wczytane_slowo + ebx + ebp]  ; Pobierz znak z wczytanego ci¹gu
    cmp al, 'u'
    je luty
    cmp al, 'i'
    je lipiec_listopad
    jmp dopisz


luty:
    inc ebp 
    mov al,byte ptr [wczytane_slowo + ebx + ebp]
    cmp al, 't'
    jne dopisz  ; Je¿eli to nie 't', to nie jest luty
    inc ebp
    mov al, byte ptr [wczytane_slowo + ebx + ebp]
    cmp al, 'y'
    jne dopisz  ; Je¿eli to nie 'y', to nie jest luty

    mov byte ptr [wypisane_slowo + edx], '2'  
	inc edx 
    add ebx, ebp

    jmp koniec



lipiec_listopad:
	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'p'
	je lipiec
	cmp al,'s'
	je listopad
	jmp dopisz

lipiec:
	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'i'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'e'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'c'
	jne dopisz

	mov wypisane_slowo[edx],'7'
	inc edx  ; Przesuñ wskaŸnik wyjœciowy do nastêpnej pozycji
    add ebx, ebp  ; Przesuñ ebx o d³ugoœæ przetworzonego miesi¹ca
	jmp koniec

listopad:
	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'t'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'o'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'p'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'a'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'d'
	jne dopisz

	mov wypisane_slowo[edx],'11'
	inc edx  ; Przesuñ wskaŸnik wyjœciowy do nastêpnej pozycji
    add ebx, ebp  ; Przesuñ ebx o d³ugoœæ przetworzonego miesi¹ca
	jmp koniec

marzec_maj:
	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'a'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'r'
	je marzec
	cmp al,'j'
	jne dopisz

	mov wypisane_slowo[edx],'5'
	inc edx  ; Przesuñ wskaŸnik wyjœciowy do nastêpnej pozycji
    add ebx, ebp  ; Przesuñ ebx o d³ugoœæ przetworzonego miesi¹ca
	jmp koniec

marzec:
	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'z'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'e'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'c'
	jne dopisz

	mov wypisane_slowo[edx],'3'
	inc edx  ; Przesuñ wskaŸnik wyjœciowy do nastêpnej pozycji
    add ebx, ebp  ; Przesuñ ebx o d³ugoœæ przetworzonego miesi¹ca
	jmp koniec

kwiecien:
	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'w'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'i'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'e'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'c'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'i'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'e'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,228
	jne dopisz

	mov wypisane_slowo[edx],'4'
	inc edx  ; Przesuñ wskaŸnik wyjœciowy do nastêpnej pozycji
    add ebx, ebp  ; Przesuñ ebx o d³ugoœæ przetworzonego miesi¹ca
	jmp koniec

czerwiec:
	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'z'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'e'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'r'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'w'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'i'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'e'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'c'
	jne dopisz

	mov wypisane_slowo[edx],'6'
	inc edx  ; Przesuñ wskaŸnik wyjœciowy do nastêpnej pozycji
    add ebx, ebp  ; Przesuñ ebx o d³ugoœæ przetworzonego miesi¹ca
	jmp koniec

wrzesien:
	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'r'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'z'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'e'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'s'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'i'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'e'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,228
	jne dopisz

	mov wypisane_slowo[edx],'9'
	inc edx  ; Przesuñ wskaŸnik wyjœciowy do nastêpnej pozycji
    add ebx, ebp  ; Przesuñ ebx o d³ugoœæ przetworzonego miesi¹ca
	jmp koniec

pazdziernik:
	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'a'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,171
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'d'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'z'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'i'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'e'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'r'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'n'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'i'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'k'
	jne dopisz

	mov wypisane_slowo[edx],'10'
	inc edx  ; Przesuñ wskaŸnik wyjœciowy do nastêpnej pozycji
    add ebx, ebp  ; Przesuñ ebx o d³ugoœæ przetworzonego miesi¹ca
	jmp koniec

grudzien:
	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'r'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'u'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'d'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'z'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'i'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,'e'
	jne dopisz

	inc ebp
	mov al,byte ptr [wczytane_slowo + ebx + ebp]
	cmp al,228
	jne dopisz

	mov wypisane_slowo[edx],'21'
	inc edx  ; Przesuñ wskaŸnik wyjœciowy do nastêpnej pozycji
    add ebx, ebp  ; Przesuñ ebx o d³ugoœæ przetworzonego miesi¹ca
	jmp koniec

dopisz:
    ; Kopiowanie niepasuj¹cego znaku do wypisane_slowo
    mov al, byte ptr [wczytane_slowo + ebx]  
	movzx ax,al
    mov [wypisane_slowo + edx], ax        ; Przepisanie znaku do wypisane_slowo
	dec ebp
    add ebx,ebp                                ; Przesuniêcie wskaŸnika w wczytane_slowo
    jmp koniec                               ; Powrót do g³ównej pêtli

	

koniec:
	inc ebx
	add edx,2
	dec ecx
	jnz ptl

	push liczba_znakow
	push OFFSET wypisane_slowo
	push 1
	call __write
	add esp,12


	push 0
	call _ExitProcess@4

_main ENDP
END