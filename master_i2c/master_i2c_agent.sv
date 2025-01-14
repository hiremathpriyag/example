class master_i2c_agent extends uvm_agent;

`uvm_component_utils(master_i2c_agent)

master_i2c_driver drvh;
master_i2c_monitor monh;
master_i2c_sequencer m_sequencer;
master_i2c_agent_config m_cfg;

extern function new(string name="master_i2c_agent",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
endclass

//new constructor
function master_i2c_agent::new(string name="master_i2c_agent",uvm_component parent);
	super.new(name,parent);
endfunction

//build phase
function void master_i2c_agent::build_phase(uvm_phase phase);
	super.build_phase(phase);
		if(!uvm_config_db #(master_i2c_agent_config)::get(this,"","master_i2c_agent_config",m_cfg))
		`uvm_fatal("master_agent","cannot get the m_cfg from master_i2c_agent_config DB")
	monh=master_i2c_monitor::type_id::create("monh",this);
	
	if(m_cfg.is_active==UVM_ACTIVE)
		begin
		     drvh=master_i2c_driver::type_id::create("drvh",this);
		     m_sequencer=master_i2c_sequencer::type_id::create("m_sequencer",this);
		end
endfunction

//connect phase
function void master_i2c_agent::connect_phase(uvm_phase phase);
	if(m_cfg.is_active==UVM_ACTIVE)
	begin
		drvh.seq_item_port.connect(m_sequencer.seq_item_export);
	end
endfunction
