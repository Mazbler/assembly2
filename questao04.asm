.data
n1: .asciiz "digite a primeira nota:"
n2: .asciiz "digite a segunda nota:"
n3: .asciiz "digite a terceira nota:"
n4: .asciiz "digite a quarta nota:"
a: .asciiz "APROVADO"
e: .asciiz "EXAME"
r: .asciiz "RETIDO"
.text
main:
li $v0, 4
la $a0, n1
syscall
li $v0, 5
syscall
move $t0, $v0

li $v0, 4
la $a0, n2
syscall
li $v0, 5
syscall
move $t1, $v0

li $v0, 4
la $a0, n3
syscall
li $v0, 5
syscall
move $t2, $v0

li $v0, 4
la $a0, n4
syscall
li $v0, 5
syscall
move $t3, $v0

add $t4, $t0, $t1
add $t4, $t4, $t2
add $t4, $t4, $t3
div $t4, $t4, 4

bge $t4, 6, aprovado
bge $t4, 3, exame
blt $t4, 3, retido

aprovado:
li $v0, 4
la $a0, a
syscall
j fim

exame:
li $v0 4
la $a0, e
syscall
j fim

retido:
li $v0, 4
la $a0, r
syscall

fim:
li $v0, 10
syscall