function solve(numbers,left,right){
	let result = []; //type
	let x;
	numbers.push('0');
	
	//console.log("exec 1"+ numbers )
	
	for((x = left; x<=right; x++)){
	if(numbers[i] == (i+1)* x) result.push(true)
		//console.log("exec 2"+ x );break;
	}
	else result.push(false)
	
	return result;
}

function solve(string){
	let result = 0;
	let a,b,c,addes1,addes2;
	
	let containera, containerb, containerc = [];
	array = string.split("");
	
	
	//keeping track of array slicer
	let len = array.length;
	 for(let iter = 3 ; iterate <= 1; iterate--)
	{ let j = 4-iterate;
		for(let newItery = 1 ;newItery < j ;newItery-- ){
			containera.push(array.slice(0,len-iterate-1).toString(","));
			containerb.push(array.slice(len-iterate-1,len-iterate).toString(","));
			containerc.push(array.slice(len-iterate,len).toString(","));
		}
		console.log("exec containera":containera);break;
	}
	
	//putting strings in 3 containers
	
	
	//add strings
	for(let a = 0 ; a< array.length ;a++ ){
		//check if 
	addes1 = containera[a]+containerb[a];
	addes2 = containerb[a]+containerc[a];
	
	//console.log("exec add strings"+addes1+addess2);break;
	if(addes1 != addres2){
		result++;
	}
	}
	
	//check equality a+b with b+c
	
	
	
	return result;
}

function solve(field, x, y){
	let result = [];
	
	
	//if concealed result -1 => not cordinate of x and y
	result = field.map((x)=> return -1) 
	
	//if cordinate of x and y == clicked show adjacent cells
	
	// if clicked cordinate, do I show random number?
	//what are the shown variables
	return result;
}



function solve(segments){
	let result = 0;
	let count;
	
	//for each cordinate check if it overlaps with other corordinates
	let newseg = segments.map((value) => {
		let newArray = [];
		for(let b = value[0]; b < value[1]; b++){
			newArray.push{b];//get all cordinates of point
		}
		return newArr;
	})
	
	for(let a = newseg.length; a > 0; a-- ){
		//check if it overlaps //1234 //12 13 14  // 23 24 //34
		//newseg.sort((a,b)=>{//check if b contains a })
		
		for(let b = a -1 ; b < 0 ;b++ ){
			newseg[a].newseg[b] 
			//compare varaibles
		}
	}
	
	//yes nulled else count++
	
	
	return result;
}