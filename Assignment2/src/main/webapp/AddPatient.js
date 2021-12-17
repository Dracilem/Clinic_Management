function validate(){
	let ICNo = document.getElementById("IC");
	let Pname = document.getElementById("pname");
	let Gender = document.getElementsByName("gender");
	let Number = document.getElementById("number");
	let Birthday = document.getElementById("birthday").value;
	let Date = document.getElementById("date").value;
	let Prescriptions = document.getElementById("prescriptions").value;
	let status = 0;
	if(ICNo.value=="")
	{
		alert("IC No. can't be null");
		return false;
	}
	if(Pname.value=="")
	{
		alert("Name can't be null");
		return false;
	}
	
	for(let temp in Gender)
	{
		if(Gender[temp].checked)
		{
			status = 1;
		}
	}
	if(status==0)
	{
		alert("Gender can't be null");
		return false;
	}
	
	if(Birthday=="")
	{
		alert("Birthday can't be null");
		return false;
	}
	
	if(Number.value=="")
	{
		alert("Phone Number can't be null");
		return false;
	}
	
	
	if(prescriptions=="Positive")
	{
		alert("Prescriptions can't be null");
		return false;
	}
	return true;
}