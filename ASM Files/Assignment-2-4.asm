# Assembly file for Assignment 2.4

.data 
  varh:	.word 
  varg:	.word 
  vari:	.word 
  varj:	.word 
  
  varGPrompt:	.asciiz "Enter g = (integer):"
  varHPrompt:	.asciiz "\nEnter h = (integer):"
  varIPrompt:	.asciiz "\nEnter i = (integer):"
  varJPrompt:	.asciiz "\nEnter j = (integer):"
  
  funcIs:	.asciiz "\nleaf_example(int g, int h, int i, int j) returns f \n"
  mathIs:	.asciiz "f = (g+h) - (i+j) \n"
  resultIs: 	.asciiz "f = "
  


.text 

main:
				# Print the prompt for g
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, varGPrompt 		# address of varGPrompt is in $a0
  syscall           			# print the string

				# Read var g
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 					# integer value read is in $v0
  add	$8, $0, $v0			# copy g into $8

				# Print the prompt for h
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, varHPrompt 		# address of varHPrompt is in $a0
  syscall           			# print the string
  
				# Read var h
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 					# integer value read is in $v0
  add	$9, $0, $v0			# copy the height into $9

    				# Print the prompt for i
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, varIPrompt 		# address of varGPrompt is in $a0
  syscall           			# print the string

				# Read var i
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 					# integer value read is in $v0
  add	$10, $0, $v0			# copy g into $8

				# Print the prompt for j
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, varJPrompt 		# address of varHPrompt is in $a0
  syscall           			# print the string
  
				# Read var j
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 					# integer value read is in $v0
  add	$11, $0, $v0			# copy the height into $9

				#Calculate first half of equation
  add $12, $8, $9			# sum of g + h stored within $t0

				#Calculate second half of equation
  add $13, $10, $11			# sum of i + j stored within $t1
  
				# Calculate the difference between the two sums
  sub $14, $t0, $t1		# difference of (g + h) - (i + j) stored into $9


				# Print programming function
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, funcIs 			# address of functionIs string is in $a0
  syscall           			# print the string

  				# Print math function
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, mathIs 			# address of functionIs string is in $a0
  syscall           			# print the string

  				# Print result string
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, resultIs 			# address of functionIs string is in $a0
  syscall           			# print the string

  				# Print the value of f (in $14)
  addi 	$v0, $0, 1  			# system call 1 is for printing an integer
  add 	$a0, $0, $14 			# bring the area value from $14 into $a0
  syscall           			# print the integer
  
				# Exit from the program
exit:
  ori $v0, $0, 10       		# system call code 10 for exit
  syscall               		# exit the program
