<?php 
	if ($_SERVER['REQUEST_METHOD'] == 'GET')
	{
		echo '{"interval":"30", "posturl":"'. 'http://' . $_SERVER['SERVER_NAME'] . $_SERVER['SCRIPT_NAME'] . '"}' ."\r\n";	

	}else if ($_SERVER['REQUEST_METHOD'] == 'POST') {

		$data = file_get_contents("php://input");
		$obj = json_decode($data, true);
		
		$file = fopen("log.html", "a+");		
		fwrite($file, "gwmac: $obj[gwmac] gwaddr:  $obj[gwaddr] gwport:  $obj[gwport]  usrnum: $obj[usrnum] gwwanaddr: $obj[gwwanaddr] gwlanaddr: $obj[gwlanaddr] <br>\r\n");

		if ($obj[usrnum])	
		{
			fwrite($file, "{<br>\r\n");
			foreach ($obj[datas] as $data)
			{
				fwrite($file, "type $data[type] mac $data[mac] start $data[start] used $data[used] end $data[end]<br>\r\n");	
			}
			fwrite($file, "}<br>\r\n");
		}
		fclose($file);			
	}
?>
