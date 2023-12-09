// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.8;
 
contract StructDemo{
    struct Employee{
       int empid;
       string name;
       string department;
       string designation;
   }
 
   Employee []emps;
 
   function addEmployee(
     int empid, string memory name, 
     string memory department, 
     string memory designation
   ) public{
       Employee memory e = Employee(empid,
                                    name,
                                    department,
                                    designation);
       emps.push(e);
   }
 
   function getEmployee( int empid ) public view returns(
     string memory, 
     string memory, 
     string memory){
       uint i;
       for(i=0;i<emps.length;i++)
       {
           Employee memory e=emps[i];
 
           // Looks for a matching employee id
           if(e.empid==empid)
           {
                  return(e.name,
                      e.department,
                      e.designation);
           }
       }
 
     // If provided employee id is not present it returns Not Found
     return("Not Found", "Not Found", "Not Found");
   }
}