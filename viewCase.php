<?php

include 'index.php';
if( isset($_GET["delete"]) )
	{
		$id = $_GET["delete"];
		$query = "DELETE FROM PMS.case WHERE CID='$id'";
    //$query = "SELECT * FROM case WHERE PRISONER_NAME='$valueToSearch'";
	 $connect = mysqli_connect("localhost", "root", "", "PMS");
    mysqli_query($connect, $query);
	}


if(isset($_REQUEST["search"]))
{
    $valueToSearch = $_POST["valueToSearch"];
    // search in all table columns
    // using concat mysql function
	$query = "SELECT * FROM PMS.case WHERE CONCAT(`CID`,`PID`, `PRISONER_NAME`,`CASE_TYPE`,`DESCRIPTION`) LIKE '%".$valueToSearch."%'";
    
    $search_result = filterTable($query);
    
}
 else {
    $query = "SELECT * FROM PMS.case";
    $search_result = filterTable($query);
}

// function to connect and execute the query
function filterTable($query)
{
    $connect = mysqli_connect("localhost", "root", "", "PMS");
    $filter_Result = mysqli_query($connect, $query);
    return $filter_Result;
}




?>


<body style="background-color:#F2F3F4;">
<!DOCTYPE html>
<html>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 90%;
	margin:10px 10px 10px 50px;
}

td {
    border: 1px solid black;
    text-align: left;
	text-size:4px;
    padding: 8px;
}
th {
	text-size:4px;
    border: 2px solid black;
    text-align: left;
    padding: 8px;
}






a {
  float: left;
  padding: 10px 12px;
  color: solid black;
  text-decoration: none;
  font-weight: bold;
  text-align: center;
  border-right: 1px solid rgba(255,255,255,0.1);
}



.search {
 background: #F2F3F4;;
 width: 60%;
  border-radius: 50px;
  padding: 10px 20px;
  margin: 20px 10px 10px 900px;
 
}	

input[type=text] {
   
    padding: 5px 10px;
    margin: 2px 0;
    display: inline-block;
    border: 1.5px solid black;
    box-sizing: border-box;
}
button {
   
    padding: 5px 10px;
    margin: 2px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
	cursor: pointer;
}
input[type=submit]{
   text-align: center;
display: inline-block;
    background-color: #8080ff;
     cursor: pointer;
    
}
</style>
    <head>
        <title>VIEW CASE</title>
     
    </head>
    <body>
        <ul class="group">


<a href="addCase.php">
<img src="images/addprisoner.png" alt="Add CASE" width="62" height="62" border="0"> <br>ADD CASE</a>
  


        <form action="viewCase.php" method="post">
		
		<div class="search">
		
		<strong>SEARCH FOR PRISONER:<br><br>
            <input type="text" name="valueToSearch" placeholder="Enter Value To Search"><br>
            &#8195;&#8195;&#8195;<input type="submit" name="search" value="SEARCH"><br><br>
           </div>

		   </ul>
		
		
		   </form>
		   &#8195;&#8195;&#8195;<strong><b>CASE DETAILS:</strong>
		  
            <table>
                <tr>
                    <th>CASE ID</th>
					
            <th>PRISONER NAME</th>
			<th>PID</th>
            <th>CASE TYPE</th>
			<th>DESCRIPTION</th>
                </tr>

      <!-- populate table from mysql database -->
                <?php while($row = mysqli_fetch_assoc($search_result)):?>
                <tr>
				<td><?php echo $row['CID']; ?></td>
				<td><?php echo $row['PRISONER_NAME']; ?></td>
                  <td><?php echo $row['PID']; ?></td>
				<td><?php echo $row['CASE_TYPE']; ?></td>
			<td><?php echo $row['DESCRIPTION']; ?></td>
			
			<td class="contact-delete">
    <form action='viewCase.php?delete="<?php echo $row['CID']; ?>"' method="get">
        <input type="hidden" name="delete" value="<?php echo $row['CID']; ?>">
        <input type="submit" name="submit" value="Delete" onclick="return confirm('Are you sure to delete?')"> </td>
			
            <td> <?php echo "<a href='updateCase.php?edit=$row[CID]'>edit<br />"; ?></td>
		
		
          
                </tr>
                <?php endwhile;?>

				</table>
        </form>
        
    </body>
</html>
