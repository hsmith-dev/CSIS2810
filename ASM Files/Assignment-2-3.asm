# Assembly file for Assignment 2.3 - Harrison Smith

.data 
  
  varPromptFirst:	.asciiz "Enter three integers to display; largest, smallest and sum.\nEnter the first number = "
  varPromptSec:		.asciiz "\nEnter the second number = "
  varPromptThird:	.asciiz "\nEnter the third number = "
  
  sumIs: 	.asciiz "\nThe results are: \nThe sum of the numbers = "
  smallIs: 	.asciiz "\nThe smallest of the numbers = "
  largeIs: 	.asciiz "\nThe largest of the numbers = "
  continue:	.asciiz "\nDo you want to continue, enter 1 for yes, 0 for no: "


.text 

main:

Loop: 	
				# Print the prompt for first integer
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, varPromptFirst 		# address of varPromptFirst is in $a0
  syscall           			# print the string

				# Read var first integer
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$8, $0, $v0			# copy first into $8

				# Print the prompt for var second integer
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, varPromptSec 		# address of varPromptSec is in $a0
  syscall           			# print the string
  
				# Read var second integer
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$9, $0, $v0			# copy second into $9
  
      				# Print the prompt for third
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, varPromptThird 		# address of varPromptThird is in $a0
  syscall           			# print the string

				# Read var third
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$10, $0, $v0			# copy third into $10
  
  				# Compute the sum of the three integers
  add $11, $8, $9			#sum of the first two integers
  add $11, $10, $11			#sum of the all three integers
  
  				# Print the sumIs and sum ($12)
  li $v0, 4 				# code 4 is to print string
  la $a0, sumIs				# $a0 is address of sumIs
  syscall 				
  					# print the value of sum
  li $v0, 1 					# code 1 is to print integer
  la $a0, ($11)					
  syscall
  				# Find the smallest integer
  move $11, $8				# smallest is now in $11
  blt $11, $9, L1
  move $11, $9 				# smallest is now in $11
  L1: 
  blt $11, $10, L2		
  move $11, $10				# smallest is now in $11
  L2:
  
    				# Print the smallIs and min
  li $v0, 4 				# code 4 is to print string
  la $a0, smallIs				# $a0 is address of sumIs
  syscall 				
  					# print the value of min
  li $v0, 1 				# code 1 is to print integer
  la $a0, ($11)				# $a0 is address of $11
  syscall
  
  				# Find the largest integers
  move $11, $8				# set inital largest
  bge $11, $9, L3
  move $11, $9				# set max to $9 if greater
  L3:
  bge $11, $10, L4
  move $11, $10				# set max to $10 if greater
  L4:
	
    				# Print the largeIs and max
  li $v0, 4 				# code 4 is to print string
  la $a0, largeIs			# $a0 is address of sumIs
  syscall 				
  					# print the value of min
  li $v0, 1 				# code 1 is to print integer
  la $a0, ($11)				# $a0 is address of
  syscall	
	
 				# Print the prompt for contiue
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, continue 			# address of varPromptFirst is in $a0
  syscall           			# print the string

				# Read var first integer
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$8, $0, $v0			# copy continue answer into $8
  
  				# Checking if == 1
  beq $8, 0, exit		# if $8 == 0 then skip to exit
  beq $8, 1, L5			# if $8 == 1 then skip to L5
  
L5:
	j Loop #jumps back to the top of Loop, only if continue is '1' otherwise it closes
				
exit: # Exit from the program
  ori $v0, $0, 10       		# system call code 10 for exit
  syscall               		# exit the program
