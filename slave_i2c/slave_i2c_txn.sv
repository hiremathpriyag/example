//  ############################################################################
//
//  Licensed to the Apache Software Foundation (ASF) under one
//  or more contributor license agreements.  See the NOTICE file
//  distributed with this work for additional information
//  regarding copyright ownership.  The ASF licenses this file
//  to you under the Apache License, Version 2.0 (the
//  "License"); you may not use this file except in compliance
//  with the License.  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing,
//  software distributed under the License is distributed on an
//  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
//  KIND, either express or implied.  See the License for the
//  specific language governing permissions and limitations
//  under the License.
//
//  ###########################################################################

//-----------------------------------------------------------------------------
// Class: slave_i2c_txn
// Description of the class :
// This class have all the transcation signals
//-----------------------------------------------------------------------------

`ifndef slave_i2c_txn
`define slave_i2c_txn

class slave_i2c_txn extends uvm_sequence_item;

	`uvm_object_utils(slave_i2c_txn)

rand bit i2c_scl;
rand bit [6:0] i2c_addr;
rand bit [7:0] i2c_data;
rand bit [7:0] count;
rand bit r_w;
rand bit ack;

bit [31:0]cpr[] ;
bit [31:0] ctrl[] ;
bit [31:0]tx [] ;
bit [31:0]rx[];
bit [31:0]cmd[] ;
bit [31:0]status[]  ;
 

//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new (string name="slave_i2c_txn");
extern function void do_print(uvm_printer printer);

endclass


//-----------------------------------------------------------------------------
// Function: new constructor
//
//
// Parameters:
//  phase - constructs  the class
//-----------------------------------------------------------------------------

function slave_i2c_txn :: new (string name ="slave_i2c_txn");
	super.new(name);
endfunction


//-----------------------------------------------------------------------------
// Function: do_print
//prints the status of all the signals
 
//-----------------------------------------------------------------------------

function void slave_i2c_txn ::do_print(uvm_printer printer);
	super.do_print(printer);
/*	printer.print_field("PADDR", this.paddr , 32, UVM_DEC);
	printer.print_field("PWDATA", this.pwdata , 32, UVM_DEC);
	printer.print_field("PENABLE", this.penable , 32, UVM_DEC);
	printer.print_field("PWRITE", this.pwrite , 32, UVM_DEC);
	printer.print_field("PRDATA", this.prdata , 32, UVM_DEC);
        printer.print_field("PREADY", this.pready , 32, UVM_DEC);
       // printer.print_field("PRSLVER", this.prslver , 32, UVM_DEC);*/
endfunction


`endif

