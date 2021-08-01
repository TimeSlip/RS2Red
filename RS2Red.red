Red [
	Title:   "RS2Red.red"
]

;My Red vars
redArray: 	make vector! [] 	
redblock:	make block! []

redSys: routine ["Add some data to the array"
/local 
	sysArray [red-vector!] 	;Red/System 
	sysBlock [red-block!] 	; ""
	str [c-string!] ;string holder
	i [integer!] ;index	
	localBlock [red-block!] ;to test a local block

][
	;Reference my Red vars
	sysArray:	 as red-vector!  	#get 'redArray
	sysBlock:	 as red-block!  	#get 'redBlock
	
	localBlock: as red-block! ["test"]
	;block/rs-clear localBlock	;causes *** Runtime Error 1: access violation
	probe localBlock
	i: 1
	str: "abcdefghijklmnop"
	loop 10 [
		;vector/rs-append-int sysArray i		;Works
		;vector/rs-append sysArray as red-value! i	;causes *** Runtime Error 1: access violation
		;block/rs-append sysBlock as red-value! i 	;causes *** Runtime Error 1: access violation
		;block/rs-append sysBlock as red-value! str 	;causes *** Runtime Error 1: access violation
		;block/rs-append-block sysBlock as red-block! i ;causes *** Compilation Error: undefined symbol: red/block/rs-append-block
		;block/rs-append localBlock as red-value! i 	;causes *** Runtime Error 1: access violation
		i: i + 1
	]
]	

seeInRed: func ["Access the data redSys added"
][

	clear redArray clear redBlock
	probe redArray
	probe redBlock
	redSys
	probe redArray
	probe redBlock
]

seeInRed
