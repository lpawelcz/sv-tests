/*
:name: random_weighted_case_randcase_1
:description: randcase test
:tags: uvm-random uvm
*/

import uvm_pkg::*;
`include "uvm_macros.svh"

function int F();
    int a;
    randcase
        0 : a = 5;
        1 : a = 10;
    endcase
    return a;
endfunction


class env extends uvm_env;
  int x;

  function new(string name, uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    begin
      x = F();

      if(x == 10) begin
        `uvm_info("RESULT", $sformatf("x = %0d SUCCESS", x), UVM_LOW);
      end else begin
        `uvm_error("RESULT", $sformatf("x = %0d FAILED", x));
      end
    end
    phase.drop_objection(this);
  endtask: run_phase
  
endclass

module top;

  env environment;

  initial begin
    environment = new("env");
    run_test();
  end
  
endmodule
